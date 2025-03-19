(use-package dwim-shell-command
  :ensure t)

(defun dwim-shell-commands-image-exif-metadata ()
  "View EXIF metadata in image(s)."
  (interactive)
  (dwim-shell-command-on-marked-files
   "View EXIF"
   "exiftool '<<f>>'"
   :utils "exiftool"))


(defun dwim-shell-commands-image-browse-location ()
  "Open image(s) location in browser."
  (interactive)
  (dwim-shell-command-on-marked-files
   "Browse location"
   "lat=\"$(exiftool -csv -n -gpslatitude -gpslongitude '<<f>>' | tail -n 1 | cut -s -d',' -f2-2)\"
    if [ -z \"$lat\" ]; then
      echo \"no latitude\"
      exit 1
    fi
    lon=\"$(exiftool -csv -n -gpslatitude -gpslongitude '<<f>>' | tail -n 1 | cut -s -d',' -f3-3)\"
    if [ -z \"$lon\" ]; then
      echo \"no longitude\"
      exit 1
    fi
    if [[ $OSTYPE == darwin* ]]; then
      open \"http://www.openstreetmap.org/?mlat=${lat}&mlon=${lon}&layers=C\"
    else
      xdg-open \"http://www.openstreetmap.org/?mlat=${lat}&mlon=${lon}&layers=C\"
    fi"
   :utils "exiftool"
   :error-autofocus t
   :silent-success t))


(defun dwim-shell-commands-image-reverse-geocode-location ()
  "Reverse geocode image(s) location."
  (interactive)
  (dwim-shell-command-on-marked-files
   "Reverse geocode"
   "lat=\"$(exiftool -csv -n -gpslatitude -gpslongitude '<<f>>' | tail -n 1 | cut -s -d',' -f2-2)\"
    if [ -z \"$lat\" ]; then
      echo \"no latitude\"
      exit 1
    fi
    lon=\"$(exiftool -csv -n -gpslatitude -gpslongitude '<<f>>' | tail -n 1 | cut -s -d',' -f3-3)\"
    if [ -z \"$lon\" ]; then
      echo \"no longitude\"
      exit 1
    fi
    json=$(curl \"https://nominatim.openstreetmap.org/reverse?format=json&accept-language=en&lat=${lat}&lon=${lon}&zoom=18&addressdetails=1\")
    echo \"json_start $json json_end\""
   :utils '("exiftool" "curl")
   :silent-success t
   :error-autofocus t
   :on-completion
   (lambda (buffer)
     (with-current-buffer buffer
       (goto-char (point-min))
       (let ((matches '()))
         (while (re-search-forward "^json_start\\(.*?\\)json_end" nil t)
           (push (match-string 1) matches))
         (message "%s" (string-join (seq-map (lambda (json)
                                               (map-elt (json-parse-string json :object-type 'alist) 'display_name))
                                             matches)
                                    "\n")))
       (kill-buffer buffer)))))
