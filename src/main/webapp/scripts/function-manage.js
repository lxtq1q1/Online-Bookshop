// JavaScript Document
function Delete(id)
{
    alert("确定要删除吗？");
	if(confirm("确定要删除吗？")) {
		location.href = "user-delete.html?id=" + id;
	}
}
