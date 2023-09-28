import React, { useEffect, useState } from 'react';
import { Row, Col, Button, Typography, Card, Avatar, Tag } from 'antd';
import axios from 'axios';

const { Title } = Typography;
const { Meta } = Card;

const renderTopics = (topics) => {
  return (
    <>
    {topics.map((topic) => {
      return (
        <Tag value={topic[0]} color="orange" key={topic[0]}>{topic[1]}</Tag>
      )
    })}
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
      let topics = renderTopics(item.topics)
      return (
        <Row key={item.id}>
          <Col span={20} offset={2}>
            <Card>
              <Meta
                avatar={<Avatar size={128} shape="square" src={item.image_url} key={item.id}/>}
                title={<a href={item.original_url} target="_blank">{item.title} </a>}
                description={<>{item.summary} {<br/>} {topics}</>}
              />
            </Card>
          </Col>
        </Row>
      );
    })}
    </>
)};