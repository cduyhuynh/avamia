import React, {useState} from 'react';
import { Layout, notification } from 'antd';
import Header from './Header';
import Feed from './Feed';

const { Content, Footer } = Layout;

export default function({content}) {
  const [items, setItems] = useState([])
  return (
    <Layout>
      <Header setItems={setItems}/>
      <Content>
        <Feed items={items} setItems={setItems}/>
      </Content>
    </Layout>
)};