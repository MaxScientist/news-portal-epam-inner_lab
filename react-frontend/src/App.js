import React, {Component, Suspense, useState} from "react";
import {Link, Route, Switch} from "react-router-dom";
import "bootstrap/dist/css/bootstrap.min.css";
import "./App.css";

import AddNews from "./components/add-news.component";
import EditNews from "./components/edit-news.component";
import ViewNews from "./components/view-news.component";
import NewsList from "./components/news-list.component";
import Login from "./components/login.component";
import Welcome from "./components/welcome.component";
import NewsDataService from "./services/news.service";
import {useTranslation} from 'react-i18next';
import router from "react-router-dom/es/Router";


// const App_log = () => {
//
// }

function Page() {
    const {t, i18n} = useTranslation();

    const changeLanguage = (lng) => {
        i18n.changeLanguage(lng);
    };

    return (
        <nav className="navbar navbar-expand navbar-dark bg-info">

            <a href="/" className="navbar-brand">
                News Portal
            </a>
            <div className="navbar-nav mr-auto">
                <li className="nav-item">
                    <a href="/news" className="nav-link">
                        {t('All_News')}
                    </a>
                </li>
                <li className="nav-item">
                    <a href="/newsen" className="nav-link">
                        {t('En_News')}

                    </a>
                </li>
                <li className="nav-item">
                    <a href="/newsru" className="nav-link">
                        {t('Ru_News')}
                    </a>
                </li>
                <li className="nav-item">
                    <a href="/add" className="nav-link">
                        {t('Pub_News')}
                    </a>
                </li>
                <li className="nav-item">
                    <div className="App">
                        <div className="App-header">
                            <button  value="en" onClick={() =>
                                changeLanguage('en')}>
                                {t('English')}
                            </button>
                            <button  value="ru" onClick={() =>
                                changeLanguage('ru')}>
                                {t('Russian')}
                            </button>
                        </div>
                    </div>
                </li>

            </div>
            <div className="navbar-nav mr">

                <li className="nav-item">
                    {/*<button onClick={NewsDataService.logout}></button>*/}

                    <Link  onClick={NewsDataService.logout} className="nav-link">
                        {t('Logout')}
                    </Link>
                </li>
            </div>

        </nav>
    )
}

class App extends Component {

    render() {
        return (
            <div>
                <Suspense fallback={'loading'}>
                    <Page/>
                </Suspense>
                <div className="container mt-3">
                    <Switch>
                        <Route exact path={["/"]} component={Welcome}/>
                        <Route exact path={["/login"]} component={Login}/>
                        <Route exact path={["/news"]} component={NewsList}/>
                        <Route exact path="/add" component={AddNews}/>
                        <Route path="/edit/:id" component={EditNews}/>
                        <Route path="/view/:id" component={ViewNews}/>
                        <Route path="/news:lang" render={(props) => <NewsList {...props} />}/>
                    </Switch>
                </div>
            </div>
        );
    }
}

export default App;