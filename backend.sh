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
useradd expense &>>$log_file
expression

rn -rf /app

mkdir /app
cd /app
expression

 echo Download $compo Code
    curl -s -o /tmp/$compo.zip https://expense-artifacts.s3.amazonaws.com/$compo.zip >>$log_file
expression

    echo Extracting $compo Code
    unzip /tmp/$compo.zip >>$log_file
expression
cd /app

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

mysql -h 172.31.17.105 -uroot -pExpenseApp@1 < /app/schema/backend.sql &>>$log_file
expression
