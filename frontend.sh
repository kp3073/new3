source var.sh

echo installing nginx
dnf install nginx -y &>>$log_file
expression

cp expense.conf /etc/nginx/default.d/expense.conf &>>$log_file




echo removing old contant
rm -rf /usr/share/nginx/html/* &>>$log_file
expression

cd /usr/share/nginx/html &>>$log_file
expression

 echo Download $compo Code
 curl -s -o /tmp/frontend.zip https://expense-artifacts.s3.amazonaws.com/frontend.zip >>$log_file
expression

 echo Extracting frontend Code
 unzip /tmp/frontend.zip >>$log_file
expression

echo restartNginx service
systemctl enable nginx &>>$log_file
systemctl restart nginx &>>$log_file
expression