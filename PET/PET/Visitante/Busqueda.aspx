<%@ Page Title="" Language="C#" MasterPageFile="~/PET.Master" AutoEventWireup="true"
    CodeBehind="Busqueda.aspx.cs" Inherits="PET.Visitante.Busqueda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .divcontenedor
        {
            width: 80%;
            height: 100px;
        }
        .divcolor
        {
            width: 100%;
            height: 95%;
            background-color: #D2D5DB;
        }
        .tablaprincipal
        {
            width: 100%;
            height: 100%;
        }
        .tdimagen
        {
            width: 17%;
            height: 100%;
        }
        .tdimagen img
        {
            width: 95%;
            height: 85%;
            vertical-align: middle;
        }
        
        .tdtabla table
        {
            height: 100%;
        }
        .Divtextos
        {
            height: 100px;
        }
        .Divtextos table
        {
            width: 100%;
            height: 100%;
        }
        
   
    </style>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
  <script src="../Scripts/jquery.magnifier.js" type="text/javascript"></script>
    <script language="javascript" type="text/jscript">
        $(document).ready(function () {
            //                        $('.tdimagen img').each(function () {
            //                            var maxWidth = $(".tdimagen").css("width");// 100; // Max width for the image
            //                            var maxHeight = $(".tdimagen").css("height");//100;    // Max height for the image
            //                            var ratio = 0;  // Used for aspect ratio
            //                            var width = $(this).width();    // Current image width
            //                            var height = $(this).height();  // Current image height

            //                            // Check if the current width is larger than the max
            //                            if (width > maxWidth) {
            //                                ratio = maxWidth / width;   // get ratio for scaling image
            //                                $(this).css("width", maxWidth); // Set new width
            //                                $(this).css("height", height * ratio);  // Scale height based on ratio
            //                                height = height * ratio;    // Reset height to match scaled image
            //                                width = width * ratio;    // Reset width to match scaled image
            //                            }

            //                            // Check if current height is larger than max
            //                            if (height > maxHeight) {
            //                                ratio = maxHeight / height; // get ratio for scaling image
            //                                $(this).css("height", maxHeight);   // Set new height
            //                                $(this).css("width", width * ratio);    // Scale width based on ratio
            //                                width = width * ratio;    // Reset width to match scaled image
            //                            }
            //                        });


            var elms = $('.tdimagen img');
            elms.each(function (pos, elm) {
                elm = $(elm);
                var allowedHeight = 80;
                var allowedWidth = 80;
                var width = elm[0].naturalWidth;
                var height = elm[0].naturalHeight;
                var ratioreal1 = height / width;
                var ratioreal0 = width / height;
                var restar = 0;
                if (width > height) {
                    elm.width(allowedWidth);
                    elm.height(allowedWidth * ratioreal1);
                }
                else {
                    elm.height(allowedHeight);
                    elm.width(allowedHeight * ratioreal0);
                }
            });



            var $targets = $('.magnify')
            $targets.each(function (i) {
                var $target = $(this)
                var options = {}
                if ($target.attr('data-magnifyto'))
                    options.magnifyto = parseFloat($target.attr('data-magnifyto'))
                if ($target.attr('data-magnifyby'))
                    options.magnifyby = parseFloat($target.attr('data-magnifyby'))
                if ($target.attr('data-magnifyduration'))
                    options.duration = parseInt($target.attr('data-magnifyduration'))
                $target.imageMagnify(options)
            })
            var $triggers = $('a[rel^="magnify["]')
            $triggers.each(function (i) {
                var $trigger = $(this)
                var targetid = $trigger.attr('rel').match(/\[.+\]/)[0].replace(/[\[\]']/g, '') //parse 'id' from rel='magnify[id]'
                $trigger.data('magnifyimageid', targetid)
                $trigger.click(function (e) {
                    $('#' + $(this).data('magnifyimageid')).trigger('click.magnify')
                    e.preventDefault()
                })
            })

            //   alert();

        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <div style="width: 100%;">
        <asp:Repeater runat="server" ID="Repeater">
            <ItemTemplate>
                <div class="divcontenedor">
                    <div class="divcolor">
                        <table class="tablaprincipal">
                            <tr>
                                <td class="tdimagen" align="center">
                                    <img alt="" src="../img/dog3.jpg" class="magnify" />
                                </td>
                                <td align="center" valign="middle">
                                    <div class="Divtextos">
                                        <table border="1px" style="width: 100%; height: 100%;">
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <br />
    <div class="divcontenedor">
        <div class="divcolor">
            <table class="tablaprincipal">
                <tr>
                    <td class="tdimagen" align="center">
                        <img alt="" src="../img/dog2.jpg"  class="magnify" />
                    </td>
                    <td align="center" valign="middle">
                        <div class="Divtextos">
                            <table border="1px" style="width: 100%; height: 100%;">
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;
                                    </td>
                                    <td>
                                        &nbsp;
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</asp:Content>
