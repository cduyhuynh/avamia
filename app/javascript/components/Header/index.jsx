import React from 'react';
import { Layout, Row, Col, Typography, Image, Select, Spin } from 'antd';
import Search from './search';

const { Header } = Layout;
const { Title, Link } = Typography;
export default function({setItems}){

  return (
    <Header style={{backgroundColor: '#7dbcea'}}>
      <Row>
        <Col span={8} offset={1}>
          <Link href="/">
            <Image height={"75%"} preview={false} src="/logo.png"/>
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