
$(function () {
  $(".trigger-js").on("ajax:success", function (e, data, status, xhr) {
    $("body").append(data);
  });
});
