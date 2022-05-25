import i18n from "i18next";
import Backend from 'i18next-http-backend'
import LanguageDetector from 'i18next-browser-languagedetector'
import {initReactI18next} from 'react-i18next';

i18n
    .use(Backend)
    .use(LanguageDetector)
    .use(initReactI18next)
    .init({
        // resources: {
        //     en: {
        //         translation: {
        //             "welcome text": "Welcome to News portal",
        //         },
        //     },
        //     ru: {
        //         translation: {
        //             "welcome text": "Добро пожаловать в Новостной портал",
        //         },
        //     },
        // },
        // lng: "en",
        // fallbackLng: "en"|| "ru",
        debug: true,
        interpolation: {
            escapeValue: false,
        },
    });

export default i18n;