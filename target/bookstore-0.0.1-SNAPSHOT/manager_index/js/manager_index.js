
function logout() {
  var r = confirm("确认要退出系统吗？");
    if (r == true){
        window.location.href="/backLoginPage.do";

        return true;
    }else {
        return false;
    }
}

function Delete_book(id)
{
    if(confirm("确定要删除吗？")) {
        location.href = "delBook.do?bid=" + id;
    }
}

function Delete_user(id)
{
    if(confirm("确定要删除吗？")) {
        location.href = "delUser.do?uid=" + id;
    }
}




