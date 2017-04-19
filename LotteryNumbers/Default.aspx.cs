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
        for (int i = 0; i<numberOfSims; i++)
        {
            newDraw = getDraw();
            int matches = 0;
            foreach(int drawn in newDraw)
            {
                foreach(int chosen in userPicks)
                {
                    if (drawn==chosen)
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
                    if (bonusBall==0)
                    {
                        new5PlusMatches++;
                    } else
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

        int raffleNumber = millionaire.Next(30000000);//30million

        if (raffleNumber == 0)
        {
            Raffle1MatchesNumber++;
        }
        else if (raffleNumber < 21)
        {
            Raffle2MatchesNumber++;
        }

        totalMatchesNumber = Raffle1MatchesNumber+ Raffle2MatchesNumber+ new2Matches+ new3Matches+ new4Matches+ new5Matches+ new5PlusMatches + new6Matches; //new1Matches

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
        //TotalWinnings.Text = totalMatchesNumber.ToString();
        Raffle1Winnings.Text = Raffle1MatchesNumber.ToString();
        Raffle2Winnings.Text = Raffle2MatchesNumber.ToString();
        BallMatches1Winnings.Text = "Nothing!";
        BallMatches2Winnings.Text = new2Matches.ToString() + " Lucky Dip(s)";
        BallMatches3Winnings.Text = "£" + (new3Matches*10).ToString();
        BallMatches4Winnings.Text = "£" + (new4Matches*100).ToString();
        BallMatches5Winnings.Text = "£" + (new5Matches*1000).ToString();
        BallMatches5PlusWinnings.Text = "£" + (new5PlusMatches*50000).ToString();
        BallMatches6Winnings.Text = "£" + (new6Matches*2000000).ToString();

        //Winnings Column
        //TotalExpected.Text = totalMatchesNumber.ToString();
        Raffle1Expected.Text = (numberOfSims/30000000).ToString();
        Raffle2Expected.Text = (20*numberOfSims/30000000).ToString();
        //BallMatches1Expected.Text = (numberOfSims).ToString();
        BallMatches2Expected.Text = (numberOfSims/ 10.3).ToString() + " Lucky Dip(s)";
        BallMatches3Expected.Text = (10*numberOfSims/ 96.2).ToString();
        BallMatches4Expected.Text = (100*numberOfSims/ 2179.85).ToString();
        BallMatches5Expected.Text = (1000*numberOfSims/ 144415).ToString();
        BallMatches5PlusExpected.Text = (50000*numberOfSims/7509579).ToString();
        BallMatches6Expected.Text = (2000000*numberOfSims/ 45057474).ToString();

        int drawCount = Convert.ToInt32(NoOfDraws.Text) + numberOfSims;
        NoOfDraws.Text = drawCount.ToString();
        CostToPlay.Text = "£" + (drawCount*2).ToString();

        PanelStats.Visible = true;
    }
}