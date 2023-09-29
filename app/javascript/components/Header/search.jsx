import React, {useState} from 'react';
import { Select, Spin, Button, notification } from 'antd';
import get from 'axios';

export default function({setItems}){
  const [fetching, setFetching] = useState(false);
  const [options, setOptions] = useState([]);
  const [tickers, setTickers] = useState([]);

  const searchTickers = () => {
    setFetching(true)
    get(`react/tickers/search`, { params: { term: term} }).
      then(res => {
        if(res.status == 200)
        {
          setOptions(res.data.tickers)
          setFetching(false)
        }
      })
      .catch((error) => {
        setFetching(false)
        console.log("error", error);
    })
  }

  const searchArticles = (e) => {
    get(`react/news/search_by_tickers`, { params: { tickers: tickers} }).
      then(res => {
        if(res.status == 200)
        {
          setItems(res.data.items)
        }
      })
      .catch((error) => {
        notification.error({
          message: 'Error',
          description: error.response.data.message,
          duration: 5
        })
    })
  }
  return (
    <>
    <Select 
      mode="multiple"
      onSearch={searchTickers}
      options={options}
      notFoundContent={fetching ? <Spin size="small" /> : null}
      placeholder="Select tickers"
      onChange={(ticker) => {
        setTickers(ticker);
      }}
      style={{width: '75%'}}
    />
    <Button onClick={searchArticles}>Search</Button>
    </>
  )
}