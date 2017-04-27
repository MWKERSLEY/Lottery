<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<%--Work to do:
    Add information box that appears on selection of an option
    Add script manager to stop the jumping up the page when reloading
    Test script to add/remove class once script manager is in place.--%>
    <%--<link href="Content/bootstrap.min.css" rel="stylesheet" />--%>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Martel+Sans:900" rel="stylesheet">
    <link href="StyleSheet.css" rel="stylesheet" />

    <%--<link href="BallStyles.css" rel="stylesheet" />--%>
    <title>Lottery Simulator</title>
<%--    <script type="text/javascript">
        function JScript() {
            var allBalls = document.getElementsByClassName('ball');
            for (var i = 0; i < allBalls.length; i++) {
                allBalls[i].classList.add('rollIn1');
            }
        }
        function JScript2() {
            var allBalls = document.getElementsByClassName('ball');
            for (var i = 0; i < allBalls.length; i++) {
                allBalls[i].classList.remove('rollIn1');
            }
        }
    </script>--%>
</head>
<body>
    <h1>Lottery Simulator</h1>
    <%--http://tangledindesign.com/demos/css3-transitions/active/--%>
    <%--<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>--%>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
    <div class="container">
    <div class="row">
        <div class="col-xs-12">
    <div class="numberOptions">
        <div class="wrapper">
	        <div class="ball rollIn1"><%--rollIn1--%>
    	        <asp:Label class="ballLabel" ID="LabelBall1" runat="server" Text=""></asp:Label>
            </div>
	        <div class="ball rollIn1">
    	        <asp:Label class="ballLabel" ID="LabelBall2" runat="server" Text=""></asp:Label>
            </div>
	        <div class="ball rollIn1">
    	        <asp:Label class="ballLabel" ID="LabelBall3" runat="server" Text=""></asp:Label>
            </div>
	        <div class="ball rollIn1">
    	        <asp:Label class="ballLabel" ID="LabelBall4" runat="server" Text=""></asp:Label>
            </div>
	        <div class="ball rollIn1">
    	        <asp:Label class="ballLabel" ID="LabelBall5" runat="server" Text=""></asp:Label>
            </div>
	        <div class="ball rollIn1">
    	        <asp:Label class="ballLabel" ID="LabelBall6" runat="server" Text=""></asp:Label>
            </div>
        </div>
        
    <div id="buttonDraw"><asp:Button ID="ButtonPickNumbers" runat="server" Text="Generate New Numbers" onClick="ButtonPickNumbers_Click" /></div><%-- OnClientClick="return JScript();" --%>
        <br />
        <asp:Label ID="LabelSimNo" runat="server" Text="Number of draws to simulate:"></asp:Label>
        <asp:DropDownList ID="DropDownListSims" runat="server">
            <asp:ListItem>1</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>
            <asp:ListItem>1000</asp:ListItem>
            <asp:ListItem>10000</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="ButtonRunSimulations" runat="server" Text="Test These Numbers" OnClick="ButtonRunSimulations_Click" /><%--OnClientClick="return JScript2();" --%><br />
        <asp:Button ID="ButtonMoreInfo" runat="server" Text="More Info" OnClick="ButtonMoreInfo_Click" />
        <asp:Panel ID="PanelInfo" runat="server" Visible="False">

            <asp:Label runat="server" Text="- This is a simulation of the UK National Lottery 'Lotto' main draw.&lt;br /&gt;
                - The value of a 'Lucky Dip' is £2.&lt;br /&gt;
                - 'Luck' is calculated as the prizes/expectancy.&lt;br /&gt;
                - 'Expectancy' is calculated as the average winnings for the number of tickets bought.&lt;br /&gt;
                - Prizes are as follows: £2m-Jackpot, £50k-5 balls + bonus, £1k-5 balls, £100--4 balls, £25-3 balls, Lucky Dip-2 balls" BorderStyle="Solid" BorderWidth="2px" TextMode="MultiLine" Width="100%"></asp:Label>
        </asp:Panel>
    </div>
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
                    <asp:TableHeaderCell Font-Bold="False">Wins</asp:TableHeaderCell>
                    <asp:TableHeaderCell Font-Bold="False">Prize</asp:TableHeaderCell>
                    <asp:TableHeaderCell Font-Bold="False">Expectancy</asp:TableHeaderCell>
                    <asp:TableHeaderCell Font-Bold="False">Luck</asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow 
                    ID="TableRow1" 
                    runat="server"
                    Visible="False">
                    <asp:TableCell>1 Balls</asp:TableCell>
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
                    <asp:TableCell>2 Balls</asp:TableCell>
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
                    <asp:TableCell>3 Balls</asp:TableCell>
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
                    <asp:TableCell>4 Balls</asp:TableCell>
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
                    <asp:TableCell>5 Balls</asp:TableCell>
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
                    <asp:TableCell>5 Balls + Bonus</asp:TableCell>
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
                    <asp:TableCell>6 Balls</asp:TableCell>
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
            <asp:Button ID="ButtonReset" runat="server" Text="Reset Simulation" OnClick="ButtonReset_Click" />
            <br />
        </asp:Panel>
    </div>
<%--    <div class="graph">
    </div>--%>
    <div class="moreInfo">
    </div>
    </div>
    </div>
    </div>

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
    <%--<asp:UpdateProgress ID="UpdateProgress1" runat="server"></asp:UpdateProgress>--%>
</body>
</html>