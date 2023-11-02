function checkdelete(){
	window.history.back();
}

document.addEventListener("DOMContentLoaded", function () {

	// "일괄 다운로드" 버튼 클릭 이벤트 리스너
    document.getElementById("bulkDownloadButton").addEventListener("click", function () {
        var downloadLinks = document.querySelectorAll("a[data-download-url]");

        downloadLinks.forEach(function (link) {
            var downloadUrl = link.getAttribute("data-download-url");
            if (downloadUrl) {
                // 파일 다운로드를 시작
                var downloadAnchor = document.createElement("a");
                downloadAnchor.href = downloadUrl;
                downloadAnchor.download = "";
                downloadAnchor.click();
            }
        });
    });
});