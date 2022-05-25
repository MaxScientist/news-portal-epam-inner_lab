import React, {Component, Suspense} from "react";
import {useTranslation} from "react-i18next";


function Page() {
    const {t} = useTranslation();

    // const changeLanguage = (lng) => {
    //     i18n.changeLanguage(lng);
    // };

    return (
        <div className="App">
            {/*<div className="App-header">*/}
            {/*    <select name="language">*/}
            {/*        <option value="en" onClick={()=>changeLanguage('en')}>English</option>*/}
            {/*        <option value="ru" onClick={()=>changeLanguage('ru')}>Russian</option>*/}
            {/*    </select>*/}
            {/*</div>*/}
            <div>
                <h1>{t('welcome text')}</h1>
                <a href="/login" type="button" className="btn btn-info">{t('Login')}</a>

            </div>
        </div>
    )
}


export default class Welcome extends Component {

    render() {
        // const{t} = this.props;
        return (
            <Suspense fallback={'loading'}>
                <Page/>

            </Suspense>
            // <div>
            //     {/*{t('welcome text')}*/}
            //     {/*<h1>{t('welcome text')}</h1>*/}
            //     <h1>Welcome</h1>
            //     <a href="/login" type="button" className="btn btn-info">Login</a>
            // </div>
        );
    }
}