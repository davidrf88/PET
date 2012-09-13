<%@ Page Title="" Language="C#" MasterPageFile="~/PET.Master" AutoEventWireup="true"
    CodeBehind="Busqueda.aspx.cs" Inherits="PET.Visitante.Busqueda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .d1
        {
            width: 150px;
        }                        
        
        .petdiv
        {
            width: 49%;
            margin: 0px 4px 0px 4px;
            background-image: url("../Images/petbg.jpg");
            border-radius: 5px;
            min-height: 120px;
            float: left;
            font-weight: 600;
            text-shadow: 1px 1px 1px Gray;
        }
        
        .imgdiv
        {
            float: left;
            width: 20%;
        }
        
        .desdiv
        {
            width: 80%;
            float: left;
        }
        
        .gender
        {
            width: 18px;
            height: 22px;
        }
        
        .leftpanel
        {
            height: 100%;
            width: 18%;
            float: left;
            padding-left: 2%;
        }
        
        .separador
        {
            width: 1px;
            float: left;
            height: 98%;
        }
        
        .rightpanel
        {
            height: 100%;
            width: 79%;
            float: right;
        }
    </style>
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.magnifier.js" type="text/javascript"></script>
    <script language="javascript" type="text/jscript">


        function pageLoad(sender, args) {
            setTimeout('Mangify();', 200);
        }

        $(document).ready(function () {
            $(".imgdiv img").each(function (pos, elm) {
                fixImage(elm);
            });
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

        function Mangify() {
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
        }

        function showLista() {
            $('#ListaMascotas').show('slow');
        }
             

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="leftpanel">
        <br />
        Mascota:
        <br />
        <asp:DropDownList ID="ddlMascota" runat="server" class="d1">
        </asp:DropDownList>
        <br />
        Raza:
        <br />
        <asp:DropDownList ID="ddlRaza" runat="server" class="d1">
        </asp:DropDownList>
        <br />
        Pagina
        <br />
        <asp:DropDownList ID="ddlPagina" runat="server" class="d1">
        </asp:DropDownList>
        <br />
        RegxPagina
        <br />
        <asp:DropDownList ID="ddlRegistrosxPagina" runat="server" class="d1" 
            AppendDataBoundItems="True">
            <asp:ListItem Value="1"></asp:ListItem>
            <asp:ListItem>2</asp:ListItem>
            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>15</asp:ListItem>
            <asp:ListItem>50</asp:ListItem>
        </asp:DropDownList>
        <br />
        Cargar
        <br />
        <asp:Button ID="BCargar" runat="server" Text="Button" onclick="BCargar_Click" />
        <br />
        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        <br />

    </div>
    <hr class="separador" />
    <asp:ScriptManager ID="ScriptManager1" runat="server" />
    <div class="rightpanel">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Repeater runat="server" ID="Repeater">
                    <ItemTemplate>
                        <%# ((Container.ItemIndex % 2) == 0) ? "&nbsp;&nbsp;&nbsp;&nbsp;<br/>" : ""%>
                        <div class="petdiv">
                            <div align="left">
                                <%# Eval("Nombre") %>
                            </div>
                            <hr />
                            <div class="imgdiv">
                                <img alt="" src="../Images/dog<%# Eval("Mascota_Id") %>.jpg" class="magnify" />
                            </div>
                            <div class="desdiv">
                                <img src="../Images/<%# (Boolean.Parse(Eval("EsMacho").ToString()))? "Male": "Female" %>.png"
                                    class="gender" alt="Genero" />
                                <br />
                                <%#ObtenerEdad(Eval("Edad").ToString())
                                %>
                                <br />
                                <%# Eval("Descripcion").ToString()
                                %>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
    </div>
</asp:Content>
