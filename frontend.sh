source var.sh
compo=frontend

echo installing nginx
dnf install nginx -y &>>$log_file
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file



echo removing old contant
rm -rf /usr/share/nginx/html/* &>>$log_file


cd /usr/share/nginx/html &>>$log_file

 echo Download $compo Code
    curl -s -o /tmp/$compo.zip https://expense-artifacts.s3.amazonaws.com/$compo.zip >>$log_file


    echo Extracting $compo Code
    unzip /tmp/$compo.zip >>$log_file

echo restartNginx service
systemctl enable nginx &>>$log_file
systemctl restart nginx &>>$log_file