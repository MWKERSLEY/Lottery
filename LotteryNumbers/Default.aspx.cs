using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>JScript();</script>");
        if (LabelBall1.Text=="")
        {
            
            List<int> pickList = getDraw();
            pickList.Sort();
            LabelBall1.Text = pickList[0].ToString();
            LabelBall2.Text = pickList[1].ToString();
            LabelBall3.Text = pickList[2].ToString();
            LabelBall4.Text = pickList[3].ToString();
            LabelBall5.Text = pickList[4].ToString();
            LabelBall6.Text = pickList[5].ToString();
        }
    }

    public Random ball = new Random();
    public Random millionaire = new Random();

    public List<int> getDraw()
    {
        //return new List<int>();
        List<int> ballList = Enumerable.Range(1, 59).ToList();
        List<int> pickList = new List<int>();
        //Random ball = new Random();
        for (int i = 0; i < 6; i++)
        {
            int ballIndex = ball.Next(59 - i);
            pickList.Add(ballList[ballIndex]);
            ballList.RemoveAt(ballIndex);
        }
        return pickList;
    }

    protected void ButtonPickNumbers_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "msg", "<script>JScript();</script>");
        List<int> pickList = getDraw();
        pickList.Sort();
        LabelBall1.Text = pickList[0].ToString();
        LabelBall2.Text = pickList[1].ToString();
        LabelBall3.Text = pickList[2].ToString();
        LabelBall4.Text = pickList[3].ToString();
        LabelBall5.Text = pickList[4].ToString();
        LabelBall6.Text = pickList[5].ToString();
    }

    protected void ButtonRunSimulations_Click(object sender, EventArgs e)
    {
        int numberOfSims = Convert.ToInt32(DropDownListSims.SelectedValue);
        int drawCount = Convert.ToInt32(NoOfDraws.Text) + numberOfSims;

        if (drawCount<500001)
        {
            NoOfDraws.Text = drawCount.ToString();
            CostToPlay.Text = "£" + (drawCount * 2).ToString();

            List<int> userPicks = new List<int>() {
            Convert.ToInt32(LabelBall1.Text),
            Convert.ToInt32(LabelBall2.Text),
            Convert.ToInt32(LabelBall3.Text),
            Convert.ToInt32(LabelBall4.Text),
            Convert.ToInt32(LabelBall5.Text),
            Convert.ToInt32(LabelBall6.Text),
        };
            int new1Matches = Convert.ToInt32(BallMatches1.Text);
            int new2Matches = Convert.ToInt32(BallMatches2.Text);
            int new3Matches = Convert.ToInt32(BallMatches3.Text);
            int new4Matches = Convert.ToInt32(BallMatches4.Text);
            int new5Matches = Convert.ToInt32(BallMatches5.Text);
            int new5PlusMatches = Convert.ToInt32(BallMatches5Plus.Text);
            int new6Matches = Convert.ToInt32(BallMatches6.Text);
            int Raffle1MatchesNumber = Convert.ToInt32(Raffle1Matches.Text);
            int Raffle2MatchesNumber = Convert.ToInt32(Raffle2Matches.Text);
            int totalMatchesNumber = Convert.ToInt32(TotalMatches.Text);

            List<int> newDraw = new List<int>();
            for (int i = 0; i < numberOfSims; i++)
            {
                newDraw = getDraw();
                int matches = 0;
                foreach (int drawn in newDraw)
                {
                    foreach (int chosen in userPicks)
                    {
                        if (drawn == chosen)
                        {
                            matches++;
                        }
                    }
                }
                switch (matches)
                {
                    case 1:
                        new1Matches++;
                        break;
                    case 2:
                        new2Matches++;
                        break;
                    case 3:
                        new3Matches++;
                        break;
                    case 4:
                        new4Matches++;
                        break;
                    case 5:
                        Random bonusBallRandom = new Random();
                        int bonusBall = bonusBallRandom.Next(53);
                        if (bonusBall == 0)
                        {
                            new5PlusMatches++;
                        }
                        else
                        {
                            new5Matches++;
                        }
                        break;
                    case 6:
                        new6Matches++;
                        break;
                    default:
                        break;
                }
            }

            int raffleNumber = millionaire.Next(12500000);//30million//12.5m

            if (raffleNumber == 1)
            {
                Raffle1MatchesNumber++;
            }
            else if (raffleNumber < 21)
            {
                Raffle2MatchesNumber++;
            }

            totalMatchesNumber = Raffle1MatchesNumber + Raffle2MatchesNumber + new2Matches + new3Matches + new4Matches + new5Matches + new5PlusMatches + new6Matches; //new1Matches

            //Outcomes Column
            TotalMatches.Text = totalMatchesNumber.ToString();
            Raffle1Matches.Text = Raffle1MatchesNumber.ToString();
            Raffle2Matches.Text = Raffle2MatchesNumber.ToString();
            BallMatches1.Text = new1Matches.ToString();
            BallMatches2.Text = new2Matches.ToString();
            BallMatches3.Text = new3Matches.ToString();
            BallMatches4.Text = new4Matches.ToString();
            BallMatches5.Text = new5Matches.ToString();
            BallMatches5Plus.Text = new5PlusMatches.ToString();
            BallMatches6.Text = new6Matches.ToString();

            //Winnings Column
            double b2w = new2Matches;
            double b3w = (new3Matches * 25);
            double b4w = new4Matches * 100;
            double b5w = new5Matches * 1000;
            double b5pw = new5PlusMatches * 50000;
            double b6w = new6Matches * 2000000;
            double r1w = Raffle1MatchesNumber * 1000000;
            double r2w = Raffle2MatchesNumber * 20000;
            double tw = b2w * 2 + b3w + b4w + b5w + b6w + b5pw + r1w + r2w;

            //TotalWinnings.Text = totalMatchesNumber.ToString();
            BallMatches1Winnings.Text = "Nothing!";
            BallMatches2Winnings.Text = new2Matches.ToString() + " Dips";
            BallMatches3Winnings.Text = "£" + (new3Matches * 25).ToString();
            BallMatches4Winnings.Text = "£" + (new4Matches * 100).ToString();
            BallMatches5Winnings.Text = "£" + (new5Matches * 1000).ToString();
            BallMatches5PlusWinnings.Text = "£" + (new5PlusMatches * 50000).ToString();
            BallMatches6Winnings.Text = "£" + (new6Matches * 2000000).ToString();
            Raffle1Winnings.Text = string.Format("£{0:N0}", r1w);
            Raffle2Winnings.Text = string.Format("£{0:N0}", r2w);
            TotalWinnings.Text = string.Format("£{0:N0}", tw);

            //main statistics
            MoneyWon.Text = string.Format("£{0:N0}", tw);
            ReturnRate.Text = string.Format("{0:P2}", tw / (drawCount * 2));

            //expected values
            double b2e = drawCount / 10.3;
            double b3e = 25 * (drawCount / 96.2);
            double b4e = 100 * (drawCount / 2179.85);
            double b5e = 1000 * (drawCount / (double)144415);
            double b5pe = drawCount * (50000 / (double)7509579);
            double b6e = drawCount * (2000000 / (double)45057474);
            double r1e = drawCount * (1000000 / (double)12500000);
            double r2e = 20 * drawCount * (20000 / (double)12500000);
            double te = b2e * 2 + b3e + b4e + b5e + b5pe + b6e + r1e + r2e;
            //Expected Column Texts
            Raffle1Expected.Text = string.Format("£{0:N0}", r1e);
            Raffle2Expected.Text = string.Format("£{0:N0}", r2e);
            BallMatches2Expected.Text = ((int)b2e).ToString() + " Dips";
            BallMatches3Expected.Text = string.Format("£{0:N0}", b3e);
            BallMatches4Expected.Text = string.Format("£{0:N0}", b4e);
            BallMatches5Expected.Text = string.Format("£{0:N0}", b5e);
            BallMatches5PlusExpected.Text = string.Format("£{0:N0}", b5pe);
            BallMatches6Expected.Text = string.Format("£{0:N0}", b6e);
            TotalExpected.Text = string.Format("£{0:N0}", te);

            //Luck
            double b2l = b2w / b2e;
            double b3l = b3w / b3e;
            double b4l = b4w / b4e;
            double b5l = b5w / b5e;
            double b5pl = b5pw / b5pe;
            double b6l = b6w / b6e;
            double r1l = r1w / r1e;
            double r2l = r2w / r2e;
            double tl = tw / te;

            BallMatches2Luck.Text = string.Format("{0:P2}", b2l);
            BallMatches3Luck.Text = string.Format("{0:P2}", b3l);
            BallMatches4Luck.Text = string.Format("{0:P2}", b4l);
            BallMatches5Luck.Text = string.Format("{0:P2}", b5l);
            BallMatches5PlusLuck.Text = string.Format("{0:P2}", b5pl);
            BallMatches6Luck.Text = string.Format("{0:P2}", b6l);
            Raffle1Luck.Text = string.Format("{0:P2}", r1l);
            Raffle2Luck.Text = string.Format("{0:P2}", r2l);
            Total1Luck.Text = string.Format("{0:P2}", tl);

            PanelStats.Visible = true;
        }
        else
        {
            LabelOutOfDraws.Visible = true;
            LabelOutOfDraws.Text = "DRAWS LIMIT REACHED! Click 'Reset Simulation' if you want to try your luck again!";
        }
    }

    protected void ButtonReset_Click(object sender, EventArgs e)
    {
        PanelStats.Visible = false;
        LabelOutOfDraws.Visible = false;

        NoOfDraws.Text = "0";
        CostToPlay.Text = "£0";
        
        //Outcomes Column
        TotalMatches.Text = "0";
        Raffle1Matches.Text = "0";
        BallMatches1.Text = "0";
        BallMatches2.Text = "0";
        BallMatches3.Text = "0";
        BallMatches4.Text = "0";
        BallMatches5.Text = "0";
        BallMatches5Plus.Text = "0";
        BallMatches6.Text = "0";

        //Winnings Column

        //TotalWinnings.Text = totalMatchesNumber.ToString();
        BallMatches1Winnings.Text = "Nothing!";
        BallMatches2Winnings.Text = "£0";
        BallMatches3Winnings.Text = "£0";
        BallMatches4Winnings.Text = "£0";
        BallMatches5Winnings.Text = "£0";
        BallMatches5PlusWinnings.Text = "£0";
        BallMatches6Winnings.Text = "£0";
        Raffle1Winnings.Text = string.Format("£{0:N0}", 0);
        Raffle2Winnings.Text = string.Format("£{0:N0}", 0);
        TotalWinnings.Text = string.Format("£{0:N0}", 0);

        //main statistics
        MoneyWon.Text = string.Format("£{0:N0}", 0);
        ReturnRate.Text = string.Format("{0:P2}", 0);
        
        //Expected Column Texts
        Raffle1Expected.Text = string.Format("£{0:N0}", 0);
        Raffle2Expected.Text = string.Format("£{0:N0}", 0);
        BallMatches2Expected.Text = "0 Dips";
        BallMatches3Expected.Text = string.Format("£{0:N0}", 0);
        BallMatches4Expected.Text = string.Format("£{0:N0}", 0);
        BallMatches5Expected.Text = string.Format("£{0:N0}", 0);
        BallMatches5PlusExpected.Text = string.Format("£{0:N0}", 0);
        BallMatches6Expected.Text = string.Format("£{0:N0}", 0);
        TotalExpected.Text = string.Format("£{0:N0}", 0);

        //Luck
        BallMatches2Luck.Text = string.Format("{0:P2}", 0);
        BallMatches3Luck.Text = string.Format("{0:P2}", 0);
        BallMatches4Luck.Text = string.Format("{0:P2}", 0);
        BallMatches5Luck.Text = string.Format("{0:P2}", 0);
        BallMatches5PlusLuck.Text = string.Format("{0:P2}", 0);
        BallMatches6Luck.Text = string.Format("{0:P2}", 0);
        Raffle1Luck.Text = string.Format("{0:P2}", 0);
        Raffle2Luck.Text = string.Format("{0:P2}", 0);
        Total1Luck.Text = string.Format("{0:P2}", 0);
    }
}