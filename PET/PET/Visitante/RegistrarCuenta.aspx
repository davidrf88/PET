<%@ Page Title="" Language="C#" MasterPageFile="~/PET.Master" AutoEventWireup="true"
    CodeBehind="RegistrarCuenta.aspx.cs" Inherits="PET.Visitante.RegistrarCuenta" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 14px;
        }
        .RegistrarTitulo
        {
            width: 459px;
            color:White;
            font-size:25px;
            font-family:Comic Sans MS;
        }
        .style3
        {
            width: 272px;
        }
        
        .watermark {
			color:Gray !important;
		}
		.watermark2 {
			color: #999 !important;
			font-style: italic !important;
		}
		.watermark3 {
			color: #c77 !important;
		}        .divRegistrar
        {
            width: 500px;
             height: 400px;
              background-color:rgb(72,72,72) ;
             border-radius: 15px;
            -ms-border-radius: 15px;
            -moz-border-radius: 15px;
            -webkit-border-radius: 15px;
            -khtml-border-radius: 15px;
        }
        
    </style>
    <link href="../Styles/uniform.default.css" rel="stylesheet" type="text/css" />
    <link href="../Styles/jquery.motionCaptcha.0.2.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.uniform.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.watermark.js" type="text/javascript"></script>
    <script src="../Scripts/jquery.motionCaptcha.0.2.js" type="text/javascript"></script>
    <script type="text/jscript" language="javascript">
        function pageLoad(sender, args) {
            
            $(".txtUsuario").watermark(" Usuario ");
            $(".txtPassword").watermark(" Password ");
            $(".txtCorreo").watermark(" Correo ");

            $("input, textarea, select,password, button").uniform();

            var regb = $(".mc-actionb");

            regb.hide();

            $('#mc-form').motionCaptcha({
                shapes: ['triangle', 'x', 'rectangle', 'circle', 'check', 'zigzag', 'arrow', 'delete', 'pigtail', 'star']
            });
        }

        $(function () {
           


        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div style=" padding-left:20px;">
  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>

    <p>
        <br />
    </p>
    <asp:Panel ID="PComenzar" runat="server">
      
          <div class="divRegistrar">
            <table style="width: 100%; height: 100%;">
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td class="RegistrarTitulo">
                        Registrate
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtUsuario" class="txtUsuario" runat="server" Font-Size="X-Large"
                            Height="40px" Width="450px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtPassword" class="txtPassword" runat="server" Font-Size="X-Large"
                            Height="40px" Width="450px" TextMode="Password" ViewStateMode="Enabled"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td class="style2">
                        <asp:TextBox ID="txtCorreo" class="txtCorreo" runat="server" Font-Size="X-Large"
                            Height="40px" Width="450px"></asp:TextBox>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td align="right" class="style2">
                        <table style="width: 100%;">
                            <tr>
                                <td align="left" class="style3">
                                    &nbsp;
                                    <asp:Image ID="IError" runat="server" ImageUrl="~/Images/warning.png" 
                                        Visible="False" />
                                    &nbsp;<asp:Label ID="LError" runat="server" Font-Bold="True" ForeColor="Silver"></asp:Label>
                                </td>
                                <td>
                                    <asp:Button ID="BRegistrar" runat="server" Height="36px" OnClick="BRegistrar_Click"
                                        Text="Registrarse" Width="176px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </div>
      
      
    </asp:Panel>
    <p>
        <br />
    </p>

    <asp:Panel ID="PConfirmar" runat="server" Visible="False">
        <div class="divRegistrar">
            <table style="width: 100%; height: 100%;">
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td class="RegistrarTitulo">
                        Es Correcta esta informacion?
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td class="style2">
                        <asp:Label ID="LUsuario" runat="server" Font-Size="Medium" ForeColor="Silver"></asp:Label>
                        <asp:HiddenField ID="HDDPassword" runat="server" />
                        <div class ="HDDCaptcha">
                        <asp:HiddenField ID="HDDCaptcha" runat="server" />
                        </div>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td class="style2">
                        <asp:Label ID="LCorreo" runat="server" Font-Size="Medium" ForeColor="Silver"></asp:Label>
                    </td>
                    
                    <td>
                        &nbsp;
                    </td>
                </tr>
                  <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td>
                    <div style="  vertical-align: middle;" align="center">
                    <div id="mc-form">
                    <div id="mcx">
					<p style="color: #C0C0C0">dibuja la figura que ves para continuar:</p>
					<canvas id="mc-canvas">
						Tu navegador es algo viejo intenta uno mas nuevo.
					</canvas>
					
				</div>
                </div>

                </div>
                     
                    </td>
                    
                    <td>
                        &nbsp;
                    </td>
                </tr>

                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td class="style2">
                        <asp:Label ID="LErrorVerdadero" class="errorVerdadero" runat="server" Font-Bold="True" ForeColor="Silver"></asp:Label>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td align="right" >
                        <table style="width: 100%;">
                            <tr>
                                <td align="left" class="style3">
                                    <asp:Button ID="BCancelar" runat="server" Height="36px" OnClick="BCancelar_Click"
                                        Text="Cancelar" Width="176px" />
                                </td>
                                <td>
                                    <asp:Button ID="BRegistrarVerdadero" class="mc-actionb" runat="server" Height="36px" OnClick="BRegistrarVerdadero_Click"
                                        Text="Registrarse" Width="176px" />
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </asp:Panel>
    <br />
    <br />
    <asp:Panel ID="PFinalizar" runat="server" Visible="False">
        <div class="divRegistrar">
            <table style="width: 100%; height: 100%;">
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td class="RegistrarTitulo">
                        Felicidades&nbsp; te has unido a PET
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td style="color: #C0C0C0; font-weight: bold;">
                        Hemos enviado un correo de confirmacion a la cuenta&nbsp; proporcionada.
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td class="style2">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td class="style2">
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;
                    </td>
                    <td align="center" class="style2">
                        <asp:Button ID="BTerminarRegistro" runat="server" Height="36px" Text="Pagina Principal"
                            Width="176px" 
                            OnClientClick=" window.location = '../Inicio.aspx'; return false;" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
        </div>
    </asp:Panel>
    <p>
        <br />
        <br />
    </p>
      </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
