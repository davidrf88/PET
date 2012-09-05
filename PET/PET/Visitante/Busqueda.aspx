<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Busqueda.aspx.cs" Inherits="PET.Visitante.Busqueda" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
<style type="text/css">
.divcontenedor
{ width:80%;  height:100px;}
.divcolor
{width:100%; height:95%; background-color: #D2D5DB;}
.tablaprincipal
{ width:100%; height: 100%;}
.tdimagen
{ width:17%; height:100%; }
.tdimagen img
{ width:95%; height:85%; vertical-align:middle;  }

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
   <br />
   <div style=" width:100%;">
   
   <asp:Repeater runat="server" ID="Repeater">
   <ItemTemplate>
   <div style=" width:80%;  height:80px;">
   <div style=" width:100%; height:95%; background-color: #D2D5DB;">
   Datos 
   </div>
   </div>
   </ItemTemplate>
   </asp:Repeater>
      
   </div>
   
   <br />
     <div class="divcontenedor">
   <div class="divcolor">
       <table class="tablaprincipal" >
           <tr >
               <td class="tdimagen" align="center">
                   <img alt="" src="" />
                   </td>
               <td>
                   &nbsp;</td>
           </tr>
           </table>
   </div>
   </div>


</asp:Content>
