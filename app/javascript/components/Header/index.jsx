import React from 'react';
import { Layout, Row, Col, Typography, Select, Spin } from 'antd';
import Search from './search';

const { Header } = Layout;
const { Title, Link } = Typography;
export default function({setItems}){

  return (
    <Header style={{backgroundColor: '#7dbcea'}}>
      <Row>
        <Col span={8} offset={1}>
          <Link href="/">
            <Title level={2}>Asset Avenue</Title>
          </Link>
        </Col>
        <Col span={6}></Col>
        <Col span={6}>
          <Search setItems={setItems}/>
        </Col>
      </Row>
    </Header>
  )
}