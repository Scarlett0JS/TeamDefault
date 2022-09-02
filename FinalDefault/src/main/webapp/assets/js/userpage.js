$(window).on('load', function () {
    load('#morecontents', '4');
    $("#more-wrap .more").on("click", function () {
        load('#morecontents', '4', '#more-wrap');
    })
});

function load(id, cnt, btn) {
    var theme_list = id + " .morecontents:not(.active)";
    var theme_length = $(theme_list).length;
    var theme_total_cnt;
    if (cnt < theme_length) {
        theme_total_cnt = cnt;
    } else {
        theme_total_cnt = theme_length;
        $('.button').hide()
    }
    $(theme_list + ":lt(" + theme_total_cnt + ")").addClass("active");
}