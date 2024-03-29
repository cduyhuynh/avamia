import React, { useEffect } from 'react';
import { Row, Col, Button, Typography, Card, Avatar, Tag } from 'antd';
import axios from 'axios';

const { Text, Link } = Typography;
const { Meta } = Card;

const renderTopics = (topics) => {
  return (
    <>
    {topics.map((topic) => {
      return (
        <Tag color="geekblue" key={topic[0]} style={{marginRight: '5px'}}>{topic[1]}</Tag>
      )
    })}
    </>
  )
}

const renderTickers = (tickers) => {
  return (
    <>
    {tickers.map((ticker) => {
      const color = tickerColor(ticker[1])
      return (
        <Tag value={ticker[0]} color={color} key={ticker[0]}>{ticker[0]}</Tag>
      )
    })}
    </>
  )
}

const tickerColor = (label) => {
  switch (label) {
    case 'Bearish':
      return '#397524'
    case 'Somewhat-Bearish':
      return '#87d068'
    case 'Neutral':
      return 'gold'
    case 'Somewhat-Bullish':
      return '#DE6768'
    case 'Bullish':
      return '#97040C'
  }
}

const renderTitle = (item) => {
  return (
    <>
      <Row>
        {renderTopics(item.topics)} 
        <Text type="secondary" style={{fontSize: '12px'}}>{item.published_at}</Text>
      </Row>
      <a href={item.url} target="_blank" style={{whiteSpace: 'pre-wrap', color: 'black'}}>
        <span style={{fontSize: '20px'}}>{item.title}</span>
      </a>
      <br/>
    </>
  )
}

const renderDescription = (item) => {
  return (
    <>
      {item.summary} 
      <br/>
      <Row style={{float: 'right'}}>
        <Col >
          {renderTickers(item.tickers)}
        </Col>
      </Row>
    </>
  )
}

export default function({items, setItems}){
  useEffect(() => {
    axios.get(`react/news`).
      then(res => {
        if(res.status == 200)
        {
          setItems(res.data.items)
        }
      })
      .catch((error) => {
        console.log("error", error);
      })
  }, []);

  return(
    <>
    {items.length == 0 && 
      <Row>
        <Col span={4} offset={10}>No related items</Col>
      </Row>
    }
    {items.map((item) => {
      return (
        <Row key={item.id}>
          <Col span={20} offset={2}>
            <Card>
              <Meta
                avatar={<Avatar size={128} shape="square" src={item.banner_image} key={item.id}/>}
                title={renderTitle(item)}
                description={renderDescription(item)}
              />
            </Card>
          </Col>
        </Row>
      );
    })}
    </>
)};