source var.sh

echo NODjs Disable
dnf module disable nodejs -y &>>$log_file

echo enable Nodjs
dnf module enable nodejs:18 -y &>>$log_file

echo installing Nodjs
dnf install nodejs -y &>>$log_file

echo coping fine
cp backend.service /etc/systemd/system/backend.service &>>$log_file

echo adding useradd
useradd expense &>>$log_file

rn -rf /app

mkdir /app
cd /app

echo Download backend Code
  curl -s -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip >>$log_file


  echo Extracting backend Code
  unzip /tmp/backend.zip >>$log_file

cd /app

echo installing NPm
npm install &>>$log_file

echo restarting service
systemctl daemon-reload &>>$log_file

systemctl enable backend &>>$log_file
systemctl start backend &>>$log_file


echo installing mysqld
dnf install mysql -y &>>$log_file

mysql -h 172.31.86.159 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file

