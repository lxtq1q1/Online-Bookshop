
function logout() {
  var r = confirm("确认要退出系统吗？");
    if (r == true){
        window.location.href="/backLoginPage.do";
        return true;
    }else {
        return false;
    }
}
