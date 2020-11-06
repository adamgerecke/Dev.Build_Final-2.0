using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Dev.Build_Final.Models;
using Dev.Build_Final.Services;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;

namespace Dev.Build_Final.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class GiftController : ControllerBase
    {

        private IDAL DAL;
        public GiftController(IDAL DAL)
        {
            this.DAL = DAL;
        }


        [HttpGet]
        public IEnumerable<gift> GetAllGifts()
        {
            return DAL.GetAllGifts();
        }



        [HttpPost("check")]
        public void toggle(gift desc)
        {

            DAL.CompleteGift(desc);
        }

        [HttpPost("add")]
        public void AddGif(gift newGift)
        {
            
            DAL.AddGift(newGift);
        }

        [HttpDelete("remove/{description}")]
        public void RemoveGift(string description)
        {
            gift destoryGift = new gift() { description = description };

            DAL.RemoveGift(destoryGift);
        }

        [HttpGet("name/{userID}")]
        public people GetUserName(int userID)
        {
            return DAL.GetUsername(userID);
        }

    }
}
