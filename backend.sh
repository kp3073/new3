source var.sh


echo NODjs Disable
dnf module disable nodejs -y &>>$log_file
expression

echo enable Nodjs
dnf module enable nodejs:18 -y &>>$log_file
expression

echo installing Nodjs
dnf install nodejs -y &>>$log_file
expression

echo coping fine
cp backend.service /etc/systemd/system/backend.service &>>$log_file
expression

echo adding useradd
id expense &>>$log_file
if [ $? -ne 0 ]; then
 useradd expense &>>$log_file
fi
expression

rm -rf /app
expression

mkdir /app
cd /app

 echo Download backend Code
  curl -s -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip >>$log_file
expression

  echo Extracting backend Code
  unzip /tmp/backend.zip >>$log_file
cd /app
expression

echo installing NPm
npm install &>>$log_file
expression

echo restarting service
systemctl daemon-reload &>>$log_file
systemctl enable backend &>>$log_file
systemctl restart backend &>>$log_file
expression

echo installing mysqld
dnf install mysql -y &>>$log_file
expression

mysql -h 172.31.87.190 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
expression