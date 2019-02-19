function submit() {
    document.getElementById("searchInput").submit();
}
function changePage(page){
    var oid = $("#oid").val();
    var oname = $("#oname").val();
    window.location.href="/BookOrder.do?pageNum="+page+"&oid="+oid+"&oname="+oname;
}

$(document).ready(function() {
    $("#submit").click(function() {
        $("#orderForm").submit();
    });
});
