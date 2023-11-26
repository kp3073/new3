source var.sh
compo=frontend

echo installing nginx
dnf install nginx -y &>>$log_file
cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file



echo removing old contant
rm -rf /usr/share/nginx/html/* &>>$log_file


cd /usr/share/nginx/html &>>$log_file

download

echo restartNginx service
systemctl enable nginx &>>$log_file
systemctl restart nginx &>>$log_file