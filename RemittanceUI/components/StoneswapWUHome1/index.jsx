import React from "react";
import CurrencyDollarUSD from "../CurrencyDollarUSD";
import CurrencyEuroEUR from "../CurrencyEuroEUR";
import "./StoneswapWUHome1.css";

function StoneswapWUHome1(props) {
  const {
    stoneswap,
    navbarLinkSendMoney,
    navbarLinkStaking,
    navbarLinkWhitepaper,
    navbarLinkDao,
    logIn,
    sendMoney,
    youSend,
    text2,
    price1,
    recipientGets,
    text1,
    price2,
    getStarted,
    cost,
    price3,
    address,
    todaysRate,
    fundsAvailable,
    inAFewSecondes,
    image1,
    spanText1,
    spanText2,
    latestTransaction4SecsAgo,
    spanText3,
    spanText4,
    transferMoneyOnlin,
    trustedByEthb3RlinFrens,
    global247Support,
    fastAndHassleFree,
  } = props;

  return (
    <div className="container-center-horizontal">
      <div className="stoneswap-wu-home1 screen">
        <div className="overlap-group6">
          <div className="overlap-group5">
            <div className="ellipse-8"></div>
            <div className="header">
              <div className="overlap-group">
                <div className="stone-swap">{stoneswap}</div>
                <div className="navbar">
                  <div className="navbar-link-send-money dmsans-medium-bright-gray-16px">{navbarLinkSendMoney}</div>
                  <div className="navbar-link-staking dmsans-medium-santas-gray-16px">{navbarLinkStaking}</div>
                  <div className="navbar-link-whitepaper dmsans-medium-santas-gray-16px">{navbarLinkWhitepaper}</div>
                  <div className="navbar-link-dao dmsans-medium-santas-gray-16px">{navbarLinkDao}</div>
                </div>
                <div className="log-in">
                  <div className="log-in-1">{logIn}</div>
                </div>
                <div className="more-menu">
                  <div className="ellipse-5"></div>
                  <div className="ellipse"></div>
                  <div className="ellipse"></div>
                </div>
              </div>
              <img className="separator" src="/img/separator@1x.svg" />
            </div>
            <div className="overlap-group4">
              <div className="group-11">
                <div className="flex-row">
                  <div className="send-money">{sendMoney}</div>
                  <img className="setting-2-1" src="/img/setting-2-1@2x.svg" />
                </div>
                <div className="overlap-group2">
                  <div className="flex-col">
                    <div className="you-send dmsans-medium-scarpa-flow-14px">{youSend}</div>
                    <div className="text dmsans-bold-eerie-black-18px">{text2}</div>
                  </div>
                  <div className="group-5">
                    <CurrencyDollarUSD />
                    <div className="price dmsans-bold-charade-24px">{price1}</div>
                    <img className="arrow-down-1-1" src="/img/arrow-down-1-1@2x.svg" />
                  </div>
                </div>
                <img className="arrow-down-1" src="/img/arrow-down-1@2x.svg" />
                <div className="overlap-group-1">
                  <div className="flex-col-1">
                    <div className="recipient-gets dmsans-medium-scarpa-flow-14px">{recipientGets}</div>
                    <div className="text dmsans-bold-eerie-black-18px">{text1}</div>
                  </div>
                  <CurrencyEuroEUR />
                  <div className="overlap-group1">
                    <div className="price-1 dmsans-bold-charade-24px">{price2}</div>
                    <div className="arrow-down-1-1-1"></div>
                  </div>
                  <img className="vector" src="/img/vector-4@2x.svg" />
                </div>
                <div className="overlap-group3">
                  <div className="get-started">{getStarted}</div>
                </div>
              </div>
              <div className="cost dmsans-medium-bright-gray-16px">{cost}</div>
              <div className="price-2 dmsans-medium-bright-gray-16px">{price3}</div>
              <p className="address dmsans-medium-bright-gray-16px">{address}</p>
              <div className="todays-rate dmsans-medium-bright-gray-16px">{todaysRate}</div>
              <div className="funds-available dmsans-medium-bright-gray-16px">{fundsAvailable}</div>
              <img className="icon-information" src="/img/vector-1@2x.svg" />
              <img className="icon-information-1" src="/img/vector-1@2x.svg" />
              <img className="icon-information-2" src="/img/vector-1@2x.svg" />
              <div className="in-a-few-secondes dmsans-medium-bright-gray-16px">{inAFewSecondes}</div>
            </div>
            <img className="image-1" src={image1} />
            <div className="group-14">
              <div className="usdeur-100">
                <span className="span">{spanText1}</span>
                <span className="span1">{spanText2}</span>
              </div>
              <div className="ellipse-container">
                <div className="ellipse-15"></div>
                <img className="ellipse-16" src="/img/ellipse-16@2x.svg" />
              </div>
              <p className="latest-transaction-4-secs-ago">{latestTransaction4SecsAgo}</p>
            </div>
            <h1 className="title">
              <span className="span0">{spanText3}</span>
              <span className="span">{spanText4}</span>
            </h1>
            <div className="transfer-money-onlin">{transferMoneyOnlin}</div>
            <div className="group">
              <img className="icon-heart" src="/img/24---basic---heart@2x.svg" />
              <img className="vector-1" src="/img/vector-5@2x.svg" />
            </div>
            <div className="trusted-by-ethb3rlin-frens dmsans-medium-black-16px">{trustedByEthb3RlinFrens}</div>
            <div className="global-247-support dmsans-medium-black-16px">{global247Support}</div>
          </div>
          <div className="group-12">
            <img className="messages-2-1" src="/img/messages-2-1@2x.svg" />
          </div>
          <img className="vector-2" src="/img/vector@2x.svg" />
          <div className="fast-and-hassle-free dmsans-medium-black-16px">{fastAndHassleFree}</div>
        </div>
      </div>
    </div>
  );
}

export default StoneswapWUHome1;
