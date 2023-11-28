log_file=/tmp/expense.log

expression() {
  if [ $? -eq 0 ]; then
      echo -e "\e[32mSUCCESS\e[0m"
      else
        echo -e "\e[31mFaild\e[0m"
      fi
}

