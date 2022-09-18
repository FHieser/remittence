import "./App.css";
import React from "react";
import { Switch, BrowserRouter as Router, Route } from "react-router-dom";
import StoneswapWUHome1 from "./components/StoneswapWUHome1";

function App() {
  return (
    <Router>
      <Switch>
        <Route path="/:path(|stoneswap-wu-home1)">
          <StoneswapWUHome1 {...stoneswapWUHome1Data} />
        </Route>
      </Switch>
    </Router>
  );
}

export default App;
const stoneswapWUHome1Data = {
    stoneswap: "StoneSwap",
    navbarLinkSendMoney: "Send money",
    navbarLinkStaking: "Staking",
    navbarLinkWhitepaper: "Whitepaper",
    navbarLinkDao: "DAO",
    logIn: "Log in",
    sendMoney: "Send Money",
    youSend: "You send",
    text2: "1,000,00",
    price1: "USD",
    recipientGets: "Recipient gets",
    text1: "998,47",
    price2: "EUR",
    getStarted: "Get Started",
    cost: "Cost:",
    price3: "0,99 USD",
    address: "1 USD =  0,9984",
    todaysRate: "Today’s rate:",
    fundsAvailable: "Funds available",
    inAFewSecondes: "In a few secondes",
    image1: "/img/image-1@2x.png",
    spanText1: "USD/EUR ",
    spanText2: "$1,00",
    latestTransaction4SecsAgo: "Latest transaction: 4 secs ago",
    spanText3: "Send money to ",
    spanText4: "Germany",
    transferMoneyOnlin: "Transfer money online to bank accounts in Germany for only $0.99.",
    trustedByEthb3RlinFrens: "Trusted by ETHB3rlin frens",
    global247Support: "Global 24/7 support",
    fastAndHassleFree: "Fast and hassle-free",
};

