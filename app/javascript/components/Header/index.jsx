import React, {useState} from 'react';
import { Layout, Row, Col, Typography, Select, Spin } from 'antd';

const { Header } = Layout;
const { Title, Link } = Typography;
export default function(){

  return (
    <Header style={{'background-color': '#7dbcea'}}>
      <Row>
        <Col span={8} offset={1}>
          <Link href="/">
            <Title level={2}>Asset Avenue</Title>
          </Link>
        </Col>
        <Col span={8}></Col>
        <Col span={4}>
          <Select 
            mode="multiple"
            style={{width: '100%'}}
          />
        </Col>
      </Row>
    </Header>
  )
}