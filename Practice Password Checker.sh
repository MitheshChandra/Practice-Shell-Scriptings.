#! /bin/bash
 is_valid_password(){
  local password=$1
  if [[ ${#password} -lt 8 || ${#password} -gt 16 ]]; then
  return 1
  fi
  if [[ ! "$password" =~ [a-z] ||! "$password" =~ [A-Z] || ! "$password" =~ [0-9] || ! "$password" =~ [^a-zA-z0-9] ]]; then
  return 2
  fi
  return 0
 }
while true; do 
  echo "Enter Password (Password must contain one lowercase, one uppercase, one digit and one special character.)"
  read -s password
  if [[ "${#password}" -lt 8 ]]; then
    echo "Entered Password is too shot. Please enter a valid Password."
  elif [[ "${#password}" -gt 16 ]]; then
    echo "Entered Password is too long. Suggest you to keep at most 16 character."
  else
    is_valid_password $password
    case $? in
      0) 
        echo "Password is valid!"
        break 
        ;;
      1) 
        echo "Password must contain 8 to 16 character only."
        ;;
      2)
        echo "Password must contain one uppercase, onel lowercase, one digit and one special character."
        ;;
      esac
    fi
  done
while true; do 
  echo "please confirm your password."
  read -s confirm_password
  if [[ "$password" == "$confirm_password" ]]; then
    echo "Password confirmed successfully."
    break
  else
    echo "Password does not match. please try again"
  fi
done
