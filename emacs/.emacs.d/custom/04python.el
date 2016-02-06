(require 'jedi)
;;auto complete
(add-to-list 'ac-sources 'ac-source-jedi-deirect)
;;
(add-hook 'python-mode-hook 'jedi:setup)
