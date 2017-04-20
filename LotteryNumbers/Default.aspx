<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="StyleSheet.css" rel="stylesheet" />
    <link href="BallStyles.css" rel="stylesheet" />
    <title>Lottery Picker</title>
</head>
<body><div class="wrapper">

	<h1>CSS3 Transitions with <code>:active</code></h1>
    <a href="http://www.tangledindesign.com/blog/get-the-ball-rolling-with-css3-transitions"><span>Back to article</span> - Get the Ball Rolling with CSS3 Transitions</a>
    
    <p>*Click and hold on the pool ball*</p>

	<div class="ball">
    	<span>2</span>
    </div>
    
    <div class="table">
        <span class="one"></span>
        <span class="two"></span>
        <span class="three"></span>
        <span class="four"></span>
        <span class="five"></span>
        <span class="six"></span>
        <span class="seven"></span>
    </div>
    
</div>
    <h1>Lottery Number Picker</h1>
    <%--http://tangledindesign.com/demos/css3-transitions/active/--%>
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <form id="form1" runat="server">
    <div class="container">
    <div class="row">
        <div class="col-xs-12">
    <div class="numberOptions">
<%--    <asp:ImageMap ID="ImageMap1" runat="server" ImageUrl="http://gifgifs.com/animations/other-animations/fire/Bonfire.gif"></asp:ImageMap>
    <asp:ImageMap ID="ImageMap2" runat="server"></asp:ImageMap>
    <asp:ImageMap ID="ImageMap3" runat="server"></asp:ImageMap>
    <asp:ImageMap ID="ImageMap4" runat="server"></asp:ImageMap>
    <asp:ImageMap ID="ImageMap5" runat="server"></asp:ImageMap>
    <asp:ImageMap ID="ImageMap6" runat="server"></asp:ImageMap>--%>
        <asp:Label class="ballLabel" ID="LabelBall1" runat="server" Text=""></asp:Label> <asp:Label class="ballLabel" ID="LabelBall2" runat="server" Text=""></asp:Label><asp:Label class="ballLabel" ID="LabelBall3" runat="server" Text=""></asp:Label><asp:Label class="ballLabel" ID="LabelBall4" runat="server" Text=""></asp:Label><asp:Label class="ballLabel" ID="LabelBall5" runat="server" Text=""></asp:Label><asp:Label class="ballLabel" ID="LabelBall6" runat="server" Text=""></asp:Label>
        <br /><br />
        <asp:Button ID="ButtonPickNumbers" runat="server" Text="Generate New Numbers" OnClick="ButtonPickNumbers_Click" />
        <asp:Label ID="LabelSimNo" runat="server" Text="Number of draws to simulate:"></asp:Label>
        <asp:DropDownList ID="DropDownListSims" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>1000</asp:ListItem>
            <asp:ListItem>10000</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="ButtonRunSimulations" runat="server" Text="Simulate Lottery Draws" OnClick="ButtonRunSimulations_Click" />
    </div>
            <br />
    <div class="stats">
        <asp:Panel ID="PanelStats" runat="server" Visible="False">
            <asp:Label ID="LabelNoOfDraws" runat="server" Text="Total number of draws: "></asp:Label><asp:Label ID="NoOfDraws" runat="server" Text="0"></asp:Label><br />
            <asp:Label ID="LabelCostToPlay" runat="server" Text="Total Cost So Far: "></asp:Label><asp:Label ID="CostToPlay" runat="server" Text="£0"></asp:Label><br />
            <asp:Label ID="LabelMoneyWon" runat="server" Text="Total Winnings: "></asp:Label><asp:Label ID="MoneyWon" runat="server" Text="£0"></asp:Label><br />
            <asp:Label ID="LabelReturnRate" runat="server" Text="Return: "></asp:Label><asp:Label ID="ReturnRate" runat="server" Text="0%"></asp:Label><br />
            <asp:Label ID="LabelOutOfDraws" runat="server" Visible="False" Font-Bold="True" Font-Size="Larger" ForeColor="Red"></asp:Label><br />
            <asp:Table ID="TableStats" 
                runat="server" 
                Font-Size="Medium" 
                CellPadding="3"
                CellSpacing="3"
                HorizontalAlign="Center">
                <asp:TableHeaderRow 
                    runat="server"
                    HorizontalAlign="Center">
                    <asp:TableHeaderCell Font-Bold="False" HorizontalAlign="Center">Outcomes</asp:TableHeaderCell>
                    <asp:TableHeaderCell Font-Bold="False">Occurances</asp:TableHeaderCell>
                    <asp:TableHeaderCell Font-Bold="False">Winnings</asp:TableHeaderCell>
                    <asp:TableHeaderCell Font-Bold="False">Expected Winnings</asp:TableHeaderCell>
                    <asp:TableHeaderCell Font-Bold="False">Luck</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow 
                    ID="TableRow1" 
                    runat="server"
                    Visible="False">
                    <asp:TableCell>1 Match</asp:TableCell>
                    <asp:TableCell><asp:Label ID="BallMatches1" runat="server" Text="0"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches1Winnings" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches1Expected" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches1Luck" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    ID="TableRow2" 
                    runat="server"
                    >
                    <asp:TableCell>2 Matches</asp:TableCell>
                    <asp:TableCell><asp:Label ID="BallMatches2" runat="server" Text="0"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches2Winnings" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches2Expected" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches2Luck" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    ID="TableRow3" 
                    runat="server"
                    >
                    <asp:TableCell>3 Matches</asp:TableCell>
                    <asp:TableCell><asp:Label ID="BallMatches3" runat="server" Text="0"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches3Winnings" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches3Expected" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches3Luck" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    ID="TableRow4" 
                    runat="server"
                    >
                    <asp:TableCell>4 Matches</asp:TableCell>
                    <asp:TableCell><asp:Label ID="BallMatches4" runat="server" Text="0"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches4Winnings" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches4Expected" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches4Luck" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    ID="TableRow5" 
                    runat="server"
                    >
                    <asp:TableCell>5 Matches</asp:TableCell>
                    <asp:TableCell><asp:Label ID="BallMatches5" runat="server" Text="0"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches5Winnings" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches5Expected" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches5Luck" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    ID="TableRow6" 
                    runat="server"
                    >
                    <asp:TableCell>5 Matches + Bonus</asp:TableCell>
                    <asp:TableCell><asp:Label ID="BallMatches5Plus" runat="server" Text="0"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches5PlusWinnings" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches5PlusExpected" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches5PlusLuck" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    ID="TableRow7" 
                    runat="server"
                    >
                    <asp:TableCell>6 Matches</asp:TableCell>
                    <asp:TableCell><asp:Label ID="BallMatches6" runat="server" Text="0"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches6Winnings" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches6Expected" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="BallMatches6Luck" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    ID="TableRow8" 
                    runat="server"
                    >
                    <asp:TableCell>Millionaire Raffle</asp:TableCell>
                    <asp:TableCell><asp:Label ID="Raffle1Matches" runat="server" Text="0"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Raffle1Winnings" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Raffle1Expected" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Raffle1Luck" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableRow 
                    ID="TableRow9" 
                    runat="server"
                    >
                    <asp:TableCell>£20K Raffle</asp:TableCell>
                    <asp:TableCell><asp:Label ID="Raffle2Matches" runat="server" Text="0"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Raffle2Winnings" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Raffle2Expected" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Raffle2Luck" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableRow>
                <asp:TableFooterRow 
                    runat="server" 
                    >
                    <asp:TableCell>Total:</asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="TotalMatches" runat="server" Text="0"></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="TotalWinnings" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="TotalExpected" runat="server" Text=""></asp:Label></asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="Total1Luck" runat="server" Text=""></asp:Label></asp:TableCell>
                </asp:TableFooterRow>
            </asp:Table>
<%--            <asp:Label ID="LabelBallMatches2" runat="server" Text="2 Ball Matches: "></asp:Label><asp:Label ID="BallMatches2" runat="server" Text="0"></asp:Label><br />
            <asp:Label ID="LabelBallMatches3" runat="server" Text="3 Ball Matches: "></asp:Label><asp:Label ID="BallMatches3" runat="server" Text="0"></asp:Label><br />
            <asp:Label ID="LabelBallMatches4" runat="server" Text="4 Ball Matches: "></asp:Label><asp:Label ID="BallMatches4" runat="server" Text="0"></asp:Label><br />
            <asp:Label ID="LabelBallMatches5" runat="server" Text="5 Ball Matches: "></asp:Label><asp:Label ID="BallMatches5" runat="server" Text="0"></asp:Label><br />
            <asp:Label ID="LabelBallMatches5Plus" runat="server" Text="5 Ball Matches Plus Bonus Ball: "></asp:Label><asp:Label ID="BallMatches5Plus" runat="server" Text="0"></asp:Label><br />
            <asp:Label ID="LabelBallMatches6" runat="server" Text="6 Ball Matches: "></asp:Label><asp:Label ID="BallMatches6" runat="server" Text="0"></asp:Label><br />--%>
            <br />
            <asp:Button ID="ButtonReset" runat="server" Text="Reset Simulation" OnClick="ButtonReset_Click" />
            <br />
        </asp:Panel>
    </div>
    <div class="graph">
    </div>
    </div>
    </div>
    </div>
    </form>
    <%--<asp:UpdateProgress ID="UpdateProgress1" runat="server"></asp:UpdateProgress>--%>
</body>
</html>