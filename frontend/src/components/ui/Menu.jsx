import React from 'react'
import Button from './Button';

const flowerList = ["Hoa sinh nhật", "Hoa cưới", "Giỏ trái cây"];

function Menu() {
    return (
        <div className='w-full'>
            <ul>
                {flowerList.map((flower, index) => (
                    <li className='' key={index}>
                        <Button string= {flower} custom='hover:bg-pink-500 bg-[#ff9dce]'/>
                    </li>
                ))}
            </ul>
        </div>
    )
}

export default Menu