<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Busqueda2.aspx.cs" Inherits="PET.Visitante.Busqueda2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
            width: 14%;
            height: 100%;
            vertical-align:middle;
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
        .Corner
        {
            -moz-border-radius-bottomright: 20px;
            border-bottom-right-radius: 20px;
            -moz-border-radius-bottomleft: 20px;
            border-bottom-left-radius: 20px;
            -moz-border-radius-topright: 20px;
            border-top-right-radius: 20px;
            -moz-border-radius-topleft: 20px;
            border-top-left-radius: 20px;
        }
    </style>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.magnifier.js" type="text/javascript"></script>
    <script language="javascript" type="text/jscript">
        $(document).ready(function () {



            $(".tdimagen img").each(function (pos, elm) {

                fixImage(elm);
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



        });






        function fixImage(elm) {
            elm = $(elm);
            var x = elm[0];

            var allowedHeight = 80;
            var allowedWidth = 80;
            var width = x.naturalWidth;
            var height = x.naturalHeight;
            var ratioreal1 = height / width;
            var ratioreal0 = width / height;
            var restar = 0;
            if (width > height) {
                elm.css('width', allowedWidth + 'px');
                elm.css('height', 'auto');
            }
            else {

                elm.css('height', allowedHeight + 'px');
                elm.css('width', 'auto');

            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <div style="width: 100%; padding-left: 40px;">
        <asp:Repeater runat="server" ID="Repeater">
            <ItemTemplate>
                <div class="divcontenedor">
                    <div class="divcolor Corner">
                        <table class="tablaprincipal">
                            <tr>
                                <td class="tdimagen" align="center">
                                    <img alt="" src="../Images/<%# Container.DataItem %>" style='width: 80px; height: 80px;' class="magnify" />
                                </td>
                                <td align="center" valign="middle">
                                    <div class="Divtextos">
                                        <table style="width: 100%; height: 100%;">
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

    </div>
    </form>
</body>
</html>
