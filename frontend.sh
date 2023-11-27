source var.sh
compo=frontend

echo installing nginx
dnf install nginx -y &>>$log_file
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file
 if [ $? -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
    else
      echo -e "\e[31mFaild\e[0m"
    fi



echo removing old contant
rm -rf /usr/share/nginx/html/* &>>$log_file
 if [ $? -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
    else
      echo -e "\e[31mFaild\e[0m"
    fi


cd /usr/share/nginx/html &>>$log_file


 echo Download $compo Code
    curl -s -o /tmp/$compo.zip https://expense-artifacts.s3.amazonaws.com/$compo.zip >>$log_file
 if [ $? -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
    else
      echo -e "\e[31mFaild\e[0m"
    fi


    echo Extracting $compo Code
    unzip /tmp/$compo.zip >>$log_file
 if [ $? -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
    else
      echo -e "\e[31mFaild\e[0m"
    fi


echo restartNginx service
systemctl enable nginx &>>$log_file
systemctl restart nginx &>>$log_file
 if [ $? -eq 0 ]; then
    echo -e "\e[32mSUCCESS\e[0m"
    else
      echo -e "\e[31mFaild\e[0m"
    fi
