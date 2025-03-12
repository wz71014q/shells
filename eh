#! /bin/bash
#!/usr/bin/env bash

# echo "IBrR.Ll-yI^Fw4(" | sudo -S cat /etc/hosts
# mac 更新文件内容
# sed -i '' -e '$ d' out.txt

ipFile='ips.txt'
hostFile='out.txt'

function checkIsIP() {
  read line
  if [[ $line =~ test.service.com$ ]]
  then
    return 1
  else
    return 0
  fi
}
function check() {
  tail -n 1 $hostFile | checkIsIP
  if (($? == 1))
  then
    sed -i "\$c $1 test.service.com" $hostFile
  else
    sed -i "\$a $1 test.service.com" $hostFile
  fi
}
function addNewline() {
  echo "请输入新环境"
  read input
  sed -i "\$i $input" $ipFile
  check $input
}
echo " 请选择要切换的环境"
select line in $(cat $ipFile)
do
    case ${line} in
      "new")
        addNewline
        break
        ;;
      ${line})
        check ${line}
        break
        ;;
      "new")
        echo "输入错误，请重新输入"
        ;;
    esac
done