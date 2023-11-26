source var.sh
component=frontend

echo installing nginx
dnf install nginx -y &>>$log_fil
cp expense.conf /etc/nginx/default.d/expense.conf



echo removing old contant
rm -rf /usr/share/nginx/html/* &>>$log_fil


cd /usr/share/nginx/html

download_and_extrect

echo restartNginx service
systemctl enable nginx &>>$log_fil
systemctl restart nginx &>>$log_fil