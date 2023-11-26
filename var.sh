log_file=/tmp/expense.log

download_and_extrect(){
  echo downloding $component content
  curl -o /tmp/$component.zip https://expense-artifacts.s3.amazonaws.com/$component.zip >>$log_file


  echo extract $component File
  unzip /tmp/$component.zip >>$log_file
}