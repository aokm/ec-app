import React from 'react';
import { BrowserRouter as Router, Switch, Route } from 'react-router-dom';

import { Header } from './components/Header';
import { Shops } from './containers/Shops';
import { Items } from './containers/Items';
import { Order } from './containers/Order';

const App = () => {
  return (
    <>
      <Header />
      <Router>
        <Switch>
          <Route exact path="/shops" component={Shops} />
          <Route exact path="/shop/:id/items" render={({ match }) => <Items match={match} />} />
          <Route exact path="/order" component={Order} />
        </Switch>
      </Router>
    </>
  );
};

export default App;
