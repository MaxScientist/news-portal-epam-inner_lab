import React, {Component, Suspense} from "react";
import {ButtonGroup, Card, Col, Form, ListGroup, Row} from 'react-bootstrap';
import NewsDataService from "../services/news.service";
import {Link} from "react-router-dom";
import {useTranslation} from "react-i18next";

function Show_Selected() {
    const {t} = useTranslation();

    return (
        <h1>{t("Show_Selected")}</h1>
    )
}

function Delete_Caption() {
    const {t} = useTranslation();

    return (
        <h1>{t("Delete")}</h1>
    )
}

export default class NewsList extends Component {
    constructor(props) {
        super(props);
        this.retrieveNewsList = this.retrieveNewsList.bind(this);
        this.refreshList = this.refreshList.bind(this);
        this.setActiveNews = this.setActiveNews.bind(this);
        this.handleInputChange = this.handleInputChange.bind(this);
        this.deleteNewsList = this.deleteNewsList.bind(this);

        this.state = {
            newsList: [],
            currentNews: null,
            currentIndex: -1,
            newsIds: [],
            language: this.props.match.params.lang
        };
    }

    handleInputChange(event) {
        const target = event.target;
        var value = target.value;

        if (target.checked) {
            this.state.newsIds[value] = value;
        } else {
            this.state.newsIds.splice(value, 1);
        }

    }

    submit() {
        alert(this.state.newsIds.filter(Number))
    }

    deleteNewsList() {
        NewsDataService.deleteList(this.state.newsIds.filter(Number))
            .then(response => {
                console.log(response.data);
                this.props.history.push('/')
                this.props.history.push('/news')
            })
            .catch(e => {
                console.log(e);
            });
    }

    componentDidMount() {
        this.retrieveNewsList();
    }

    retrieveNewsList() {
        if (this.state.language != null) {
            NewsDataService.getByLang(this.state.language)
                .then(response => {
                    this.setState({
                        newsList: response.data
                    });
                    console.log(response.data);
                })
                .catch(e => {
                    console.log(e);
                });
        } else {
            NewsDataService.getAll()
                .then(response => {
                    this.setState({
                        newsList: response.data
                    });
                    console.log(response.data);
                })
                .catch(e => {
                    console.log(e);
                });
        }
    }

    refreshList() {
        this.retrieveNewsList();
        this.setState({
            currentNews: null,
            currentIndex: -1
        });
    }

    setActiveNews(newsList, index) {
        this.setState({
            currentNews: newsList,
            currentIndex: index
        });
    }

    getParsedDate(strDate) {
        var strSplitDate = String(strDate).split(',');
        var date = new Date(strSplitDate[0]);
        var dd = date.getDate();
        var mm = date.getMonth() + 1; //January is 0!

        var yyyy = date.getFullYear();
        if (dd < 10) {
            dd = '0' + dd;
        }
        if (mm < 10) {
            mm = '0' + mm;
        }
        date = dd + "-" + mm + "-" + yyyy;
        return date.toString();
    }

    render() {

        const {newsList} = this.state;

        return (
            <div>
                <ListGroup variant="flush">
                    {newsList.map(currentNews => (
                        <ListGroup.Item>
                            <Card align="left">
                                <Card.Header>
                                    <Row>
                                        <Col>
                                            {currentNews.title}
                                            <Col xs={4}></Col>
                                            {this.getParsedDate(currentNews.newsDate)}
                                        </Col>
                                    </Row>
                                </Card.Header>
                                <Card.Body>
                                    <Card.Text>
                                        {currentNews.content}
                                    </Card.Text>
                                    <ButtonGroup aria-label="Basic example">
                                        <Link
                                            to={"/view/" + currentNews.id}
                                            className="link"
                                        >
                                            View
                                        </Link>
                                        <Link
                                            to={"/edit/" + currentNews.id}
                                            className="link"
                                        >
                                            Edit
                                        </Link>
                                        <Form.Check aria-label="option 1" className="checkbox" value={currentNews.id}
                                                    onChange={this.handleInputChange}/>
                                    </ButtonGroup>

                                </Card.Body>
                            </Card>
                        </ListGroup.Item>

                    ))}
                </ListGroup>
                <div class="form-row">

                    <div class="col-md-12 text-center">
                        {/*<Suspense fallback={"Loading"}>*/}
                        {/*    <Page/>*/}
                        {/*</Suspense>*/}
                        <button type="button" class="btn btn-primary" onClick={() => this.submit()}>
                            <Suspense fallback={"loading"}>
                                <Show_Selected/>
                            </Suspense>
                        </button>
                        <button
                            className="btn my-button btn-danger"
                            onClick={this.deleteNewsList}
                        >
                            <Suspense fallback={"loading"}>
                                <Delete_Caption/>
                            </Suspense>
                        </button>
                    </div>
                </div>
            </div>
        )
            ;
    }
}