function doLike() {
  console.log(pid + "," + uid);
  const d = {
    uid: uid,
    pid: pid,
    operation: "like",
  };
  $.ajax({
    url: "LikeServlet",
    data: d,
    success: function (data, textstatus, jqXHR) {
      console.log(data);
    },
    error: function (jqXHR, textstatus, errorThrown) {
      console.log(data);
    },
  });
}
