// 发送日志

const syslog = require("./syslog-client");

// 端口，默认514，一般不用改
const options = {
  port: 514
}
// const target = '127.0.0.1'; // 目标地址
const target = '10.48.185.32'; // 目标地址
const client = syslog.createClient(target, options);

// 日志信息
const msg = 'id=tos time="2021-11-25 10:52:06" fw=TopsecOS  pri=6 type=ac recorder=tos_fw_nat src=10.12.7.101 dst=10.0.98.143 sport=4048 dport=446 smac=00:e0:fc:86:54:0e dmac=00:90:fb:0e:dd:9f proto=tcp indev=eth5 outdev=eth4 user= rule=accept connid=682102025 parentid=0 dpiid=0 natid=0 policyid=8156 policyname=policyname  desc="descdescdesc" msg="vpn日志过滤a" usr=testUsr';

client.log(msg);