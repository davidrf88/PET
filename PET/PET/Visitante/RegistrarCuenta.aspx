<%@ Page Title="" Language="C#" MasterPageFile="~/PET.Master" AutoEventWireup="true" CodeBehind="RegistrarCuenta.aspx.cs" Inherits="PET.Visitante.RegistrarCuenta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 14px;
        }
        .style2
        {
            width: 459px;
        }
        .style3
        {
            width: 272px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        <br />
    </p>
    <asp:Panel ID="PComenzar" runat="server">

    <div style="width: 500px; height: 300px; background-image: url('../Images/petbg.jpg');">
        <table style="width: 100%; height: 100%;">
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    Registrate</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    <asp:TextBox ID="txtUsuario" runat="server" Font-Size="X-Large" Height="40px" 
                        Width="430px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    <asp:TextBox ID="txtPassword" runat="server" Font-Size="X-Large" Height="40px" 
                        Width="430px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    <asp:TextBox ID="txtCorreo" runat="server" Font-Size="X-Large" Height="40px" 
                        Width="430px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td align="right" class="style2">
                    <table style="width:100%;">
                        <tr>
                            <td align="left" class="style3">
                                <asp:Label ID="LError" runat="server" Font-Bold="True" ForeColor="Maroon"></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="BRegistrar" runat="server" Height="36px" 
                                    onclick="BRegistrar_Click" Text="Registrarse" Width="176px" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;</td>
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
    <div style="width: 500px; height: 300px; background-image: url('../Images/petbg.jpg');">
        <table style="width: 100%; height: 100%;">
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    Es Correcta esta informacion?</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="LUsuario" runat="server" Font-Size="X-Large"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="LCorreo" runat="server" Font-Size="X-Large"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style2">
                    <asp:Label ID="LErrorVerdadero" runat="server" Font-Bold="True" 
                        ForeColor="Maroon"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td align="right" class="style2">
                    <table style="width:100%;">
                        <tr>
                            <td align="left" class="style3">
                                <asp:Button ID="BCancelar" runat="server" Height="36px" 
                                    onclick="BCancelar_Click" Text="Cancelar" Width="176px" />
                            </td>
                            <td>
                                <asp:Button ID="BRegistrarVerdadero" runat="server" Height="36px" 
                                    onclick="BRegistrarVerdadero_Click" Text="Registrarse" Width="176px" />
                            </td>
                        </tr>
                    </table>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
      
       
    </div>
    </asp:Panel>
    <br />
    <br />
    <asp:Panel ID="PFinalizar" runat="server" Visible="False">
     <div style="width: 500px; height: 300px; background-image: url('../Images/petbg.jpg');">
            <table style="width: 100%; height: 100%;">
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="style2">
                        Felicidades&nbsp; te has unido a PET</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="style2">
                        Hemos enviado un correo de confirmacion a la cuenta de correo proporcionada.</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td class="style2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="style1">
                        &nbsp;</td>
                    <td align="center" class="style2">
                        <asp:Button ID="BRegistrarVerdadero0" runat="server" Height="36px" 
                            Text="Pagina Principal" Width="176px" 
                            onclick="BRegistrarVerdadero0_Click" />
                    </td>
                    <td>
                        &nbsp;</td>
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
</asp:Content>
