<%@ Page EnableEventValidation="false" Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">

        .table1
        {
            border: 3px solid #333333;
            border-collapse: collapse;
        }
        .style1
        {
            height: 47px;
        }
    </style>
</head>
<body bgcolor="#333333">
    <form id="form1" runat="server">
    <div>
    
        <table align="center" cellpadding="14" class="table1" 
            style="width: 27%; height: 460px;">
            <tr>
                <td align="center" bgcolor="#333333" colspan="2">
                    <asp:Label ID="Label1" runat="server" BorderColor="#BF6000" 
                        BorderStyle="Groove" EnableTheming="True" Font-Bold="True" Font-Size="XX-Large" 
                        Font-Underline="False" ForeColor="#BF6000" Height="40px" Text="Student Details" 
                        Width="367px"></asp:Label>
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#BF6000">
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="White" 
                        Text="Student Name:"></asp:Label>
                </td>
                <td align="left" bgcolor="#BF6000">
                    <asp:TextBox ID="TextBox1" runat="server" ValidationGroup="insertDetails" 
                        Width="131px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="TextBox1" Display="Dynamic" 
                        ErrorMessage="Student Name Required!" Font-Bold="True" ForeColor="#FF3300" 
                        ValidationGroup="insertDetails" Font-Size="Large">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#BF6000">
                    <asp:Label ID="Label3" runat="server" Font-Bold="True" ForeColor="White" 
                        Text="Select Branch:"></asp:Label>
                </td>
                <td align="left" bgcolor="#BF6000">
                    <asp:RadioButton ID="RadioButton1" runat="server" Checked="True" 
                        Font-Bold="True" ForeColor="White" GroupName="gender" Text="BCA" 
                        ValidationGroup="insertDetails" />
                    <asp:RadioButton ID="RadioButton2" runat="server" Font-Bold="True" 
                        ForeColor="White" GroupName="gender" Text="B.Sc (IT)" 
                        ValidationGroup="insertDetails" />
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#BF6000">
                    <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="White" 
                        Text="Select Academic Year:"></asp:Label>
                </td>
                <td align="left" bgcolor="#BF6000">
                    <asp:DropDownList ID="DropDownList1" runat="server" ValidationGroup="insertDetails">
                        <asp:ListItem Value="-1">Select Year</asp:ListItem>
                        <asp:ListItem>First Year</asp:ListItem>
                        <asp:ListItem>Second Year</asp:ListItem>
                        <asp:ListItem>Third Year</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="DropDownList1" Display="Dynamic" 
                        ErrorMessage="Academic Year Required!" Font-Bold="True" 
                        ForeColor="#FF3300" InitialValue="-1" ValidationGroup="insertDetails" 
                        Font-Size="Large">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#BF6000">
                    <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Size="Medium" 
                        ForeColor="White" Text="Select Technologies:"></asp:Label>
                </td>
                <td align="left" bgcolor="#BF6000">
                    <asp:CheckBoxList ID="CheckBoxList1" runat="server" Font-Bold="True" 
                        ForeColor="White" RepeatColumns="2" Width="203px">
                        <asp:ListItem>C/C++</asp:ListItem>
                        <asp:ListItem>C#</asp:ListItem>
                        <asp:ListItem>Java</asp:ListItem>
                        <asp:ListItem>Python</asp:ListItem>
                        <asp:ListItem>PHP</asp:ListItem>
                        <asp:ListItem>ASP.NET</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#BF6000" class="style1" colspan="2">
                    <asp:Button ID="Button1" runat="server" BackColor="#00CC00" Font-Bold="True" 
                        Font-Italic="False" Font-Names="Georgia" Font-Overline="False" 
                        Font-Size="Large" Font-Strikeout="False" Font-Underline="False" 
                        ForeColor="White" Height="33px" onclick="Button1_Click" 
                        OnMouseOver="this.style.cursor='pointer'" Text="Add Student" 
                        ValidationGroup="insertDetails" Width="322px" />
                    <asp:Button ID="Button5" runat="server" BackColor="Black" Enabled="False" 
                        Font-Bold="True" Font-Names="Georgia" Font-Size="Large" ForeColor="Silver" 
                        Height="33px" onclick="Button5_Click" OnMouseOver="this.style.cursor='pointer'" 
                        Text="Update Details" ValidationGroup="insertDetails" Width="322px" />
                    <asp:Button ID="Button4" runat="server" BackColor="#CC0000" Font-Bold="True" 
                        Font-Names="Georgia" Font-Size="Large" ForeColor="White" Height="33px" 
                        onclick="Button4_Click" OnMouseOver="this.style.cursor='pointer'" 
                        Text="Reset Form" Width="322px" />
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#333333" class="style1" colspan="2">
                    <font color="white"><b>
                    <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                    </b></font>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" 
                        BackColor="#CC0000" DisplayMode="List" Font-Bold="True" ForeColor="White" 
                        ValidationGroup="insertDetails" />
                </td>
            </tr>
        </table>
    
    </div>
    <table align="center" style="padding: 5px; width:50%; height: 149px;">
        <tr>
            <td align="center" bgcolor="#BF6000" style="padding: inherit; margin: auto">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="XX-Large" 
                    Font-Underline="True" ForeColor="White" Text="Student List"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" style="padding: inherit; margin: auto">
                <asp:GridView ID="GridView1" runat="server" CellPadding="0" ForeColor="#333333" 
                    GridLines="None" Height="128px" HorizontalAlign="Center" Width="100%">
                    <AlternatingRowStyle BackColor="White" ForeColor="#BF6000" 
                        HorizontalAlign="Center" />
                    <Columns>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:Button ID="Button2" runat="server" BackColor="#CC0000" 
                                    CommandArgument='<%# Eval("id") %>' Font-Bold="True" Font-Names="Georgia" 
                                    Font-Size="Medium" ForeColor="White" onclick="Button2_Click" 
                                    OnClientClick="confirm('Are you sure you want to Delete this Record?')" 
                                    OnMouseOver="this.style.cursor='pointer'" Text="Delete" 
                                    ValidationGroup="deleteRecord" Width="93px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Update">
                            <ItemTemplate>
                                <asp:Button ID="Button3" runat="server" BackColor="#00CC00" 
                                    CommandArgument='<%# Eval("id") %>' Font-Bold="True" Font-Names="Georgia" 
                                    Font-Size="Medium" ForeColor="White" onclick="Button3_Click" 
                                    OnMouseOver="this.style.cursor='pointer'" Text="Update" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EditRowStyle BackColor="#999999" Font-Bold="False" />
                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#BF6000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
