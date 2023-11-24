echo NODjs Disable
dnf module disable nodejs -y >>/tmp/expense.log

echo enable Nodjs
dnf module enable nodejs:18 -y >>/tmp/expense.log

echo installing Nodjs
dnf install nodejs -y >>/tmp/expense.log

echo coping fine
cp backend.service /etc/systemd/system/backend.service >>/tmp/expense.log

echo adding useradd
useradd expense >>/tmp/expense.log

echo changing dir
mkdir /app >>/tmp/expense.log


echo dowloading backend contant
curl -o /tmp/backend.zip https://expense-artifacts.s3.amazonaws.com/backend.zip >>/tmp/expense.log
cd /app >>/tmp/expense.log

echo unziping the file
unzip /tmp/backend.zip >>/tmp/expense.log

cd /app >>/tmp/expense.log

echo installing NPm
npm install >>/tmp/expense.log

echo restarting service
systemctl daemon-reload >>/tmp/expense.log

systemctl enable backend >>/tmp/expense.log
systemctl start backend >>/tmp/expense.log


echo installing mysqld
dnf install mysql -y >>/tmp/expense.log

mysql -h 172.31.95.103 -uroot -pExpenseApp@1 < /app/schema/backend.sql >>/tmp/expense.log

