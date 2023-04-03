"use strict"

async function init() {
    const site_id = 'MLB';

    const price = document.querySelector(
        'div.ui-pdp-price__second-line > span.andes-money-amount.ui-pdp-price__part.andes-money-amount--cents-superscript.andes-money-amount--compact > span.andes-money-amount__fraction'
    )?.innerText.replace('.', '') || '0';

    const cents = document.querySelector(
        'div.ui-pdp-price__second-line > span > span.andes-money-amount__cents.andes-money-amount__cents--superscript-36'
    )?.innerText || "0";

    let sold = document.querySelector('.ui-pdp-header__subtitle').innerText.split(' ')[4];

    if (sold.length > 3) {
        if (sold.includes('mil')) {
            sold = sold.split('+')[1];
            sold = sold.split('m')[0];

            sold = sold + '000';
        } else {
            sold = sold.split('+')[1];
            sold = sold.split('m')[0];
        }
    }

    const container = document.querySelector('.ui-pdp-header__title-container');

    const idAd = document.querySelector('meta[name="twitter:app:url:iphone"]')?.content.split('id=')[1];
    const mlResponse = await handleMlApi(`https://api.mercadolibre.com/items?ids=${idAd}`);
    const { body: { category_id, listing_type_id, start_time } } = mlResponse[0] || null;
    const { sale_fee_amount } =
        (await handleMlApi(
            `https://api.mercadolibre.com/sites/${site_id}/listing_prices?price=${price}&listing_type_id=${listing_type_id}&category_id=${category_id}`
        )) || {};

    const total = (Number(price + '.' + cents) * Number(sold));
    const unitReceipt = Number(price + '.' + cents) - sale_fee_amount;
    const receipt = unitReceipt * sold;

    const startTime = new Date(start_time);
    const today = new Date();
    const oneDay = 24 * 60 * 60 * 1000; // h m s m
    const diffDays = Math.round(Math.abs(startTime - today) / oneDay);
    const daySellAvg = receipt / diffDays;

    container.insertAdjacentHTML(
        'beforebegin',
        `
        <ul class="mlext-container">
            <li>Receita bruta: <span>${formatMoney(total)}</span></li>
            <li>Receita líquida: <span>${formatMoney(receipt)}</span></li>
            <li>Receita por unidade: <span>${formatMoney(unitReceipt)}</span></li>
            <li>Receita média diária: <span>${formatMoney(daySellAvg)}</span></li>
            <li>Comissão ML: <span>${formatMoney(sale_fee_amount)}</span></li>
            <li>Criado em: <span>${formatDate(startTime)} - ${diffDays} dias atrás</span></li>
        </ul>
        `
    );
}

function formatMoney(value) {
    return value.toLocaleString('pt-BR', {
        style: 'currency',
        currency: 'BRL',
    }).toString();
}

function formatDate(date) {
    const day = date.getDate().toString().padStart(2, '0'),
        month = (date.getMonth() + 1).toString().padStart(2, '0'),
        year = date.getFullYear().toString();

    return `${day}/${month}/${year}`;
}

async function handleMlApi(url) {
    try {
        const config = {
            method: 'GET',
            headers: {
                Accept: 'application/json',
                'Content-Type': 'application/json',
            },
        }

        const response = await fetch(url, config);
        const data = await response.json();

        return data;
    } catch (err) {
        console.log("Erro na requisição:", err);
    }
}

init();
