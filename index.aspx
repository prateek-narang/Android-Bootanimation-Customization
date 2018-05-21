<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="home" EnableViewState="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ABC</title>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="css/material.min.css" rel="stylesheet" />
    <link href="css/material.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet" />
    <link rel="stylesheet" href="./css/material-icon.css" />
    <link rel="stylesheet" href="./css/material.teal-indigo.min.css" />
    <link rel="shortcut icon" href="./images/android.png"  />
    <script src="js/material.min.js"></script>
    <script src="js/script.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="mdl-layout mdl-js-layout">
            <header class="mdl-layout__header mdl-layout__header--waterfall mdl-layout__header--waterfall-hide-top"
                style="display:block !important">
                <div class="mdl-layout__header-row">
                    <span class="mdl-layout-title"><i class="material-icons">android</i></span>
                    <nav class="mdl-navigation">
                        <a id="home_navig" class="mdl-navigation__link mdl-js-ripple-effect" href="#">Home</a>
                        <a href="#" id="preload_navig" class="mdl-navigation__link">
                            <asp:Button ID="open_preloaded_animations_dialog" OnClientClick="return false;"
                                runat="server" Text="Preloaded Animations"
                                Style="background: none;border: 0;color: white;cursor: pointer;" />
                        </a>
                    </nav>
                    <div class="mdl-layout-spacer"></div>
                    <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable mdl-textfield--floating-label
                        mdl-textfield--align-right">
                        <span class="mdl-layout-title">Android Bootanimation Customization</span>
                    </div>
                </div>
            </header>
            <div id="main" class="mdl-layout__content">
                <div class="mdl-grid">
                    <div class="mdl-cell mdl-cell--4-col"></div>
                    <div class="mdl-cell mdl-cell--4-col">
                        <div id="home" class="mdl-card mdl-shadow--4dp">
                            <div class="mdl-card__media">
                                <img src="images/travel.jpg" width="330" height="225" />
                            </div>
                            <div class="mdl-card__title mdl-card--border">
                                <h3 class="mdl-card__title-text">Android Bootanimation</h3>
                            </div>
                            <div class="mdl-card__supporting-text">
                                <asp:FileUpload ID="FileUpload" runat="server" AllowMultiple="true" />
                                <asp:Button ID="open_device_dialog" OnClientClick="return false;" runat="server"
                                    CssClass="mdl-button mdl-button--icon mdl-js-button mdl-js-ripple-effect"
                                    Style="background: url(./images/file_upload.png) no-repeat" />
                            </div>
                            <div class="mdl-card__supporting-text">
                                <asp:Label runat="server" ID="StatusLabel"/>
                            </div>
                        </div>
                        <div id="preload" style="display:none;" class="mdl-card mdl-shadow--4dp">
                            <div class="mdl-card__media">
                                <img src="images/travel.jpg" width="330" height="225" />
                            </div>
                            <div class="mdl-card__title mdl-card--border">
                                <h3 class="mdl-card__title-text">Choose Animation</h3>
                            </div>
                            <div class="mdl-card__supporting-text">
                                <asp:DropDownList ID="DropDownList1" CssClass="mdl-select__input" runat="server">
                                    <asp:ListItem Value="walk_man">Walk Man</asp:ListItem>
                                    <asp:ListItem Value="google">Google</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="mdl-card__supporting-text">
                                <asp:Button ID="Button2" CssClass="mdl-button"
                                    Style="background: url(./images/file_download.png) no-repeat" 
                                    runat="server" OnClick="download_preloaded"></asp:Button>
                            </div>
                            <div class="mdl-card__supporting-text">
                                <asp:Label runat="server" ID="Label1" />
                            </div>
                        </div>
                    </div>
                    <div class="mdl-cell mdl-cell--4-col"></div>
                </div>
                <dialog id="device-dialog" class="mdl-dialog">
                    <h4 class="mdl-dialog__title">Select Device</h4>
                    <div class="mdl-dialog__content">
                        <form action="#">
                            <div class="mdl-select mdl-js-select mdl-select--floating-label">
                                <asp:DropDownList ID="DropDownList" CssClass="mdl-select__input" runat="server">
                                    <asp:ListItem Value="1920_1080">Lenovo Zuk Z1 (Z1) [1920 x 1080]</asp:ListItem>
                                    <asp:ListItem Value="1920_1080">Lenovo K6 (K33a48) [1920 x 1080]</asp:ListItem>
                                    <asp:ListItem Value="1270_720">Xiaomi Redmi 4 [1270 x 720]</asp:ListItem>
                                    <asp:ListItem Value="800_480">Gionne (P2) [800 x 480]</asp:ListItem>
                                </asp:DropDownList>
                                <label class="mdl-select__label" for="device">Select Device</label>
                            </div>
                        </form>
                    </div>
                    <div class="mdl-dialog__actions">
                        <asp:Button ID="Button_Download" CssClass="mdl-button close" runat="server" Text="Download"
                            OnClick="uploadFile"></asp:Button>
                        <asp:Button ID="Button_Cancel" CssClass="mdl-button close" runat="server" Text="Cancel"></asp:Button>
                    </div>
                </dialog>
                <script>
                    var dialog = document.querySelector('#device-dialog');
                    var showDialogButton = document.querySelector('#open_device_dialog');

                    if (!dialog.showModal) {
                        dialogPolyfill.registerDialog(dialog);
                    }
                    showDialogButton.addEventListener('click', function () {
                        dialog.showModal();
                    });
                    dialog.querySelector('.close').addEventListener('click', function () {
                        dialog.close();
                    });
                </script>
            </div>
            <footer class="mdl-mini-footer" style="padding: 10px 6px;">
                <div class="mdl-mini-footer__left-section">
                    <div class="mdl-logo">&copy; ABC</div>
                </div>
                <div class="mdl-mini-footer__right-section">
                    <ul class="mdl-mini-footer__link-list">
                        <li><a href="#">Help</a></li>
                        <li><a href="#">Privacy & Terms</a></li>
                    </ul>
                </div>
            </footer>
            <script>
                var home_navig = document.querySelector('#home_navig');
                var preload_navig = document.querySelector('#preload_navig');
                var home = document.querySelector('#home');
                var pre = document.querySelector('#preload');
                home_navig.onclick = function ()
                {
                    home.style.display = "block";
                    pre.style.display = "none";
                }
                preload_navig.onclick = function () {
                    pre.style.display = "block";
                    home.style.display = "none";
                }
            </script>
        </div>
    </form>
</body>
</html>
