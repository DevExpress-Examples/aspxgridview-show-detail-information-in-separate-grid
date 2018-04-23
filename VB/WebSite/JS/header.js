function _aspxTLoadStyleSheet(styleSheet) {
    var link = document.createElement("link");
    link.setAttribute("type", "text/css");
    link.setAttribute("href", __aspxTutorialsBasePath + "/Css/" + styleSheet);
    link.setAttribute("rel", "stylesheet");
    var head = document.getElementsByTagName("head")[0];
    head.appendChild(link);
}
function _aspxTSaveStateToCookies(isExpanded) {
    document.cookie = "TutorialDescriptionExpanded=" + isExpanded.toString() + "; expires=Thu, 13 Sep 3007 14:07:07 GMT; path=/";
}
function _aspxTRemovePaddings() {
    var descTd = document.getElementById('description');
    if (descTd)
        descTd.style.padding = "";
}
function _aspxTRestorePaddings() {
    var descTd = document.getElementById('description');
    if (descTd)
        descTd.style.padding = "9px 11px 10px 11px";

}
function _aspxTExpandCollapseDescription() {
    var desc = document.getElementById(__aspxTutorialHeaderClientID + "_pnlDescription");
    var img = document.getElementById(__aspxTutorialHeaderClientID + "_imgExpandCollapse");
    if (desc != null && img != null) {
        if (desc.style.display == "none") {
            img.src = img.src.replace("descArrowDown.gif", "descArrowUp.gif");
            _aspxTSaveStateToCookies(true);
            _aspxTRestorePaddings();
            desc.style.display = "block";
        } else {
            img.src = img.src.replace("descArrowUp.gif", "descArrowDown.gif");
            _aspxTSaveStateToCookies(false);
            _aspxTRemovePaddings();
            desc.style.display = "none";
        }
    }
}
_aspxTLoadStyleSheet("header.css");