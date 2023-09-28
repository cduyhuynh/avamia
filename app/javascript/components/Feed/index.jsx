import React, { useEffect, useState } from 'react';
import { Row, Col, Button, Typography, Card, Avatar, Tag } from 'antd';
import axios from 'axios';

const { Title, Text, Link } = Typography;
const { Meta } = Card;

const renderTopics = (topics) => {
  return (
    <>
    {topics.map((topic) => {
      return (
        <Tag color="geekblue" style={{'margin-right': '5px'}}>{topic[1]}</Tag>
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
      return '#87d068'
    case 'Somewhat-Bearish':
      return 'green'
    case 'Neutral':
      return 'gold'
    case 'Somewhat-Bullish':
      return 'magenta'
    case 'Bullish':
      return 'red'
  }
}

const renderTitle = (item) => {
  return (
    <>
      <Row>
        {renderTopics(item.topics)} 
        <Text type="secondary" style={{'font-size': '12px'}}>{item.published_at}</Text>
      </Row>
      <a href={item.original_url} target="_blank" style={{'white-space': 'pre-wrap', 'color': 'black'}}>
        <span style={{'font-size': '20px'}}>{item.title}</span>
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

export default function(){
  const [items, setItems] = useState([]);
  useEffect(() => {
    axios.get(`react/news`, { params: { page: 1 }}).
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

  const loadLatest = () => {
    console.log('loadLatest')
  }

  return(
    <>
    <Row>
      <Col span={4} offset={11}>
        <br />
        <Button type="link" onClick={loadLatest}>Load latest news</Button>
        <br />
      </Col>
    </Row>
    {items.map((item) => {
      return (
        <Row key={item.id}>
          <Col span={20} offset={2}>
            <Card>
              <Meta
                avatar={<Avatar size={128} shape="square" src={item.image_url} key={item.id}/>}
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